package com.springmvc.core;

/**
 * 结果集
 */
public class ResultMsg {

    private Object data=null;

    private String msg="操作成功";

    private String status="0";

    public ResultMsg(){}

    public ResultMsg(String msg,String status,Object data){
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
}
