package com.webPokerGame.framework.web.handler;

import com.webPokerGame.common.core.domain.AjaxResult;
import org.springframework.core.MethodParameter;
import org.springframework.util.ObjectUtils;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * <p>
 * 统一响应格式
 * </p>
 * @author litzhi
 * @description  {@link com.webPokerGame.common.core.domain.AjaxResult}
 * @time 2023/4/14 14:23
 */
public class MyMethodReturnValueHandler implements HandlerMethodReturnValueHandler {

    private final HandlerMethodReturnValueHandler returnValueHandler;

    public MyMethodReturnValueHandler(HandlerMethodReturnValueHandler returnValueHandler) {
        this.returnValueHandler = returnValueHandler;
    }

    @Override
    public boolean supportsReturnType(MethodParameter returnType) {
        // 若返回类型不为AjaxResult且没有IgnoreAjaxResult注解 则进行包裹AjaxResult
        return returnType.getParameterType() != AjaxResult.class
                && ObjectUtils.isEmpty(returnType.getAnnotatedElement().getAnnotation(IgnoreAjaxResult.class));
    }

    @Override
    public void handleReturnValue(Object returnValue, MethodParameter returnType, ModelAndViewContainer mavContainer, NativeWebRequest webRequest) throws Exception {
        this.returnValueHandler.handleReturnValue(AjaxResult.success(returnValue),returnType,mavContainer,webRequest);
    }
}
