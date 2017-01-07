package com.springmvc.resolver;

import com.fasterxml.jackson.databind.JsonNode;
import com.springmvc.core.JsonArgument;
import com.springmvc.util.JsonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.annotation.RequestParamMethodArgumentResolver;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;


public class RequestJsonStringMethodArgumentResolver extends
        RequestParamMethodArgumentResolver {

    private final static String APPLICATION_FORM_URLENCODED_VALUE_UTF8 = "application/x-www-form-urlencoded; charset=UTF-8";

    public RequestJsonStringMethodArgumentResolver() {
        super(true);
    }

    public boolean supportsParameter(MethodParameter parameter) {
        
        return  parameter.hasParameterAnnotation(JsonArgument.class);
    }


    @Override
    protected Object resolveName(String name, MethodParameter parameter,
                                 NativeWebRequest webRequest) throws Exception {

        Object obj = null;

        String argumentName = parameter.getParameterAnnotation(JsonArgument.class).value();

        if(StringUtils.isNotEmpty(argumentName)){
            name = argumentName;
        }

        String[] paramValues = webRequest.getParameterValues(name);

        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        String application_type = request.getContentType();

        if(application_type.equals(MediaType.APPLICATION_FORM_URLENCODED_VALUE) || application_type.startsWith(MediaType.APPLICATION_FORM_URLENCODED_VALUE)){

            if(paramValues!=null && paramValues.length==1){
                String value = paramValues[0];
                if(StringUtils.isNoneBlank(value)){
                    obj = convertObject(parameter,value);
                }
            }

        }else if(MediaType.APPLICATION_JSON_UTF8_VALUE.equals(application_type) || MediaType.APPLICATION_JSON_VALUE.equals(application_type)){

            BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream()));
            String line = null;
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            String jsonStr = sb.toString();

            JsonNode rootNode = JsonUtil.getObjectMapper().readTree(jsonStr);
            JsonNode vNode  = rootNode.get(name);
            if(vNode!=null){
                obj =  convertObject(parameter,vNode.toString());
            }else if(jsonStr!=null && jsonStr.length()>0){
                obj =  convertObject(parameter,jsonStr);
            }
        }


        return obj;
    }


    private Object convertObject(MethodParameter parameter, String jsonStr) throws Exception {

        Object obj = null;
        Class clazz = parameter.getParameterType();
        try {
            if(Collection.class.isAssignableFrom(clazz)){
                Type ptype = parameter.getGenericParameterType();
                Class<?> componentType = Object.class;
                if(ptype instanceof ParameterizedType) {
                    componentType = (Class<?>)((ParameterizedType)ptype).getActualTypeArguments()[0];
                }
                obj =  JsonUtil.getObjectMapper().readValue(jsonStr,JsonUtil.getCollectionType(clazz,componentType));
            }else{
                obj =  JsonUtil.getObjectMapper().readValue(jsonStr,JsonUtil.getCollectionType(clazz));
            }
        } catch (Exception e) {
            throw new Exception("Could not read request json parameter", e);
        }

        return obj;

    }

    @Override
    protected void handleMissingValue(String paramName, MethodParameter parameter) throws ServletException {
        String paramType = parameter.getParameterType().getName();
        throw new ServletRequestBindingException(
                "Missing request json parameter '" + paramName + "' for method parameter type [" + paramType + "]");
    }

}