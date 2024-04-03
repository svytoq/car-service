package carservicecrm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @ExceptionHandler(Throwable.class)
    public String handleErrors(Model model) {
        model.addAttribute("message", "Произошла ошибка!");
        return "error";
    }

    @GetMapping("/error")
    public String showErrorPage() {
        return "error";
    }
}