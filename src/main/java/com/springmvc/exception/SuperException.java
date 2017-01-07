package com.springmvc.exception;


import com.springmvc.core.ResultMsg;

public abstract class SuperException extends Exception {

    public String msg;

    public String code;

    public Object data;


    public SuperException(){
        super();
    }


    public SuperException(String msg , String code , Object data){
        super(msg);
        this.code=code;
        this.msg=msg;
        this.data = data;
    }

    public SuperException(String msg , String code ){
        super(msg);
        this.code=code;
        this.msg=msg;
    }


    public ResultMsg getResultMsg(){

        ResultMsg msg = new ResultMsg();
        msg.setMsg(this.msg);
        msg.setStatus(this.code);
        msg.setData(this.data);

        return msg;
    }


}
