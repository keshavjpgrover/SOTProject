package com.railway.TicketManagement.exception;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;
public class ResourceNotFoundException extends RuntimeException {

    // This annotation will cause Spring to respond with the specified HTTP status code whenever this exception is thrown@ResponseStatus(value = HttpStatus.NOT_FOUND)public class ResourceNotFoundException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public ResourceNotFoundException(String message) {
        super(message);
    }
    public ResourceNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}

