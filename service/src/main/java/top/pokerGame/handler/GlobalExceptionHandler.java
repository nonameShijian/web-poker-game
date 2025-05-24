package top.pokergame.handler;

import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import top.pokergame.entity.Result;

@ControllerAdvice
public class GlobalExceptionHandler {

    // 拦截所有未处理的异常
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Result<String>> handleAllExceptions(Exception ex, WebRequest request) {
        Result<String> errorResult = Result.error("服务器内部错误: " + ex.getMessage());
        return new ResponseEntity<>(errorResult, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 可以添加更多特定异常的处理器
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Result<String>> handleIllegalArgumentException(IllegalArgumentException ex) {
        Result<String> errorResult = Result.error("参数错误: " + ex.getMessage());
        return new ResponseEntity<>(errorResult, HttpStatus.BAD_REQUEST);
    }

    // 示例：自定义异常
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<Result<String>> handleResourceNotFoundException(ResourceNotFoundException ex) {
        Result<String> errorResult = Result.notFound(ex.getMessage());
        return new ResponseEntity<>(errorResult, HttpStatus.NOT_FOUND);
    }
}
