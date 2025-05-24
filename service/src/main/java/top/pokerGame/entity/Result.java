package top.pokergame.entity;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Result<T> implements Serializable {

    public static final int SUCCESS = 200;
    public static final int ERROR = 500;
    public static final int NOT_FOUND = 404;

    private int code;
    private String message;
    private T data;

    public static <T> Result<T> success(T data) {
        return new Result<>(SUCCESS, "成功", data);
    }

    public static <T> Result<T> error(String message) {
        return new Result<>(ERROR, message, null);
    }

    public static <T> Result<T> notFound(String message) {
        return new Result<>(NOT_FOUND, message, null);
    }
}
