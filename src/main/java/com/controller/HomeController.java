package com.controller;

import com.dto.BookWarehouseDto;
import com.dto.CustomerDto;
import com.service.CustomerService;
import com.serviceClientRest.ClientRestService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;
import java.util.List;

@Controller
public class HomeController extends AbstractController{

    @Autowired
    @Qualifier("customerService")
    private CustomerService customerService;

    @Autowired
    @Qualifier("clientRestService")
    private ClientRestService clientRestService;

    private static final Logger logger = LogManager.getLogger(HomeController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model){
        List<BookWarehouseDto> bookWarehouseDto = clientRestService.getAllbookWarehouseDto();
        model.addAttribute("bookWarehouseDto", bookWarehouseDto);

        return "homePage";
    }

    @RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
    public String aboutUs(){
        return "aboutUsPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout, Model model) {
        BasicConfigurator.configure();
        getLogger().info("Inside login method");

        if (error != null) {
            model.addAttribute("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addAttribute("msg", "You've been logged out successfully.");
        }

        return "loginPage";
    }
    public static Logger getLogger() {
        return logger;
    }

}
