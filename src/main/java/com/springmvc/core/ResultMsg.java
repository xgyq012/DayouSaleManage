package com.springmvc.core;

import org.springframework.data.domain.Page;

/**
 * 结果集
 */
public class ResultMsg {

    private Long total;

    private Object data=null;

    private String msg="操作成功";

    private String status="0";

    public ResultMsg(){}



    public ResultMsg(String msg,Object data){
        this.msg = msg;
        this.data = data;
    }

    public ResultMsg(String msg,String status, Object data){
        this.msg = msg;
        this.status=status;
        this.data = data;
    }


    public ResultMsg(String msg , String status){
        this.status=status;
        this.msg = msg;
    }

    public ResultMsg(Object data){
        this.data = data;
    }


    public <T> ResultMsg(Page<T> page){
        this.total = page.getTotalElements();
        this.data = page.getContent();
        this.msg="";
    }


    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
