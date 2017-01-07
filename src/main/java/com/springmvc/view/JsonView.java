package com.springmvc.view;

import com.springmvc.util.JsonUtil;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * @author Will WM. Zhang
 * @since 2016-12-20 11:49
 */
public class JsonView extends AbstractView {

    @Override
    protected void renderMergedOutputModel(
            Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            PrintWriter writer = response.getWriter();
            writer.write(JsonUtil.getObjectMapper().writeValueAsString(model.get("result")));
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
