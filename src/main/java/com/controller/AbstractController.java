package com.controller;

import com.dto.BookWarehouseDto;
import com.service.CustomerService;
import com.serviceClientRest.ClientRestService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import java.security.Principal;

public class AbstractController {

    @Autowired
    @Qualifier("customerService")
    private CustomerService customerService;

    private static final Logger logger = LogManager.getLogger(CustomerController.class);

    @ModelAttribute("firstName")
    public String getFirstName(Principal principal){
        if(principal != null) {
           return customerService.getFirstName(principal).getFirstName();
        }
        return null;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        BasicConfigurator.configure();
        getLogger().info("Inside initBinder method");

        StringTrimmerEditor firstName = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, "firstName", firstName);

        StringTrimmerEditor lastName = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, "lastName", lastName);

        StringTrimmerEditor email = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, "email", email);

        StringTrimmerEditor password = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, "password", password);
    }

    public static Logger getLogger() {
        return logger;
    }
}
