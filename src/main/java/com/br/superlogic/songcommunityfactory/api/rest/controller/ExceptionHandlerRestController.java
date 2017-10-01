package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.message.ErrorMessage;
import com.br.superlogic.songcommunityfactory.message.ErrorMessageBuilder;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 *
 * @author Diego
 */
@RestControllerAdvice("com.br.superlogic.songcommunityfactory.api.rest.controller")
public class ExceptionHandlerRestController
{

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorMessage> defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception
    {
        ErrorMessage error = ErrorMessageBuilder.fromBindingErrors(e);
        return new ResponseEntity<>(error, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler({MethodArgumentNotValidException.class})
    public ResponseEntity<ErrorMessage> defaultErrorHandler(HttpServletRequest req, MethodArgumentNotValidException e) throws Exception
    {
        ErrorMessage error = ErrorMessageBuilder.fromBindingErrors(e);
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }
    
    
    @ExceptionHandler({IllegalArgumentException.class})
    public ResponseEntity<ErrorMessage> defaultErrorHandler(HttpServletRequest req, IllegalArgumentException e) throws Exception
    {
        ErrorMessage error = ErrorMessageBuilder.fromBindingErrors(e);
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }
    
    
}
