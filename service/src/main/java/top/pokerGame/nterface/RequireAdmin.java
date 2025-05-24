package top.pokergame.nterface;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD) // 注解用于方法上
@Retention(RetentionPolicy.RUNTIME) // 注解在运行时有效
public @interface RequireAdmin {
}
