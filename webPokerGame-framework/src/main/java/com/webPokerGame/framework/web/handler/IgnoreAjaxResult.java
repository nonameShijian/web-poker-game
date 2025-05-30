package com.webPokerGame.framework.web.handler;


import java.lang.annotation.*;

/**
 * 不需要 AjaxResult 包裹返回
 * {@link com.webPokerGame.common.core.domain.AjaxResult}
 * @author litzhi
 */
@Target({ ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface IgnoreAjaxResult {
}
