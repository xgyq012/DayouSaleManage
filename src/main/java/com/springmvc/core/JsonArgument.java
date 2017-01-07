package com.springmvc.core;

import java.lang.annotation.*;



@Target({ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface JsonArgument {

    String value();

}
