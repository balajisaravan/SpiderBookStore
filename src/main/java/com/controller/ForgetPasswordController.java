package com.controller;

import com.dto.ForgetPasswordDto;
import com.service.ForgetPasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class ForgetPasswordController {

    @Autowired
    private ForgetPasswordService forgetPasswordService;

    @RequestMapping(value = "/forgetPassword", method = RequestMethod.GET)
    public String forgetPassword(Model model) {
        model.addAttribute("forgetPasswordDto", new ForgetPasswordDto());

        return "forgetPasswordPage";
    }

    @RequestMapping(value = "/forgetPasswordSave", method = RequestMethod.POST)
    public String forgetPasswordSave(@Valid @ModelAttribute ForgetPasswordDto forgetPasswordDto, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {

            return "forgetPasswordPage";
        } else {
            forgetPasswordService.forgetPasswordSave(forgetPasswordDto);

            return "loginPage";
        }
    }
}
