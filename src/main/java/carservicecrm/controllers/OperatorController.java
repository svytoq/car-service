package carservicecrm.controllers;

import carservicecrm.models.Question;
import carservicecrm.services.OperatorService;
import carservicecrm.services.QuestionService;
import carservicecrm.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAnyAuthority('ROLE_OPERATOR','ROLE_ADMIN')")
public class OperatorController {
    private final UserService userService;
    private final QuestionService questionService;

    @GetMapping("/operator/panel")
    public String admin(Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("questions",questionService.list());
        return "operator";
    }


    @PostMapping("/operator/delete/question/{id}")
    public String deleteQuestion(@PathVariable Long id) {
        questionService.deleteQuestion(id);
        return "redirect:/operator/panel";
    }



}
