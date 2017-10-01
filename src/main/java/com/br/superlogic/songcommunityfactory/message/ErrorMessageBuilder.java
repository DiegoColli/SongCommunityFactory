package com.br.superlogic.songcommunityfactory.message;

import java.io.PrintWriter;
import java.io.StringWriter;
import org.springframework.web.bind.MethodArgumentNotValidException;

/**
 *
 * @author Diego
 */
public class ErrorMessageBuilder {

    public static ErrorMessage fromBindingErrors(MethodArgumentNotValidException e) {

        ErrorMessage error = new ErrorMessage("Falha de Validação. " + e.getBindingResult().getErrorCount() + " error(s)");
        e.getBindingResult().getAllErrors().forEach((objectError) -> {
            error.add(objectError.getDefaultMessage());
        });

        return error;
    }

    public static ErrorMessage fromBindingErrors(IllegalArgumentException e) {

        ErrorMessage error = new ErrorMessage(e.getMessage());
        for (StackTraceElement error1 : e.getStackTrace()) {
            error.add(error1.toString());
        }

        return error;
    }

    public static ErrorMessage fromBindingErrors(Exception e) {

        ErrorMessage error = new ErrorMessage("Falha da aplicação: " + e.getMessage());

        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        error.add(sw.toString()); // stack trace as a string

        return error;
    }

}
