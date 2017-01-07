package com.springmvc.core;

import java.lang.annotation.*;

/**
 * Created by hellow on 2016/12/9.
 */

@Target({ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface JsonArgument {

    String value();

}
