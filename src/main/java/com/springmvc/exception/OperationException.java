package com.springmvc.exception;

public class OperationException extends SuperException {


    public OperationException() {
        super();
    }

    public OperationException(String msg, String code, Object data) {
        super(msg, code, data);
    }

    public OperationException(String msg, String code) {
        super(msg, code);
    }

}
