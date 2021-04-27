package com.controller;

import com.customValidation.CustomerCustomValidation;
import com.dto.BookWarehouseDto;
import com.dto.CustomerDto;
import com.service.CustomerService;
import com.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class CustomerController extends AbstractController{

    @Autowired
    @Qualifier("customerService")
    private CustomerService customerService;

    @Autowired
    private CustomerCustomValidation customerCustomValidation;

    @Autowired
    private EmailService emailService;

    private static final Logger logger = LogManager.getLogger(CustomerController.class);

    @RequestMapping(value = "/customerRegistration", method = RequestMethod.GET)
    public String customerRegistration(Model model) {
        getLogger().info("Inside customerRegistration method");
        model.addAttribute("customerDto", new CustomerDto());

        return "customerRegistrationPage";
    }

    @RequestMapping(value = "/customerRegistrationSave", method = RequestMethod.POST)
    public String customerRegistrationSave(@ModelAttribute CustomerDto customerDto, BindingResult bindingResult) {
        int count = customerService.ifSameEmail(customerDto);
        if (count > 0) {
            bindingResult.rejectValue("email", "customerDto.sameEmailExist", " *Email address is already in use");
        }
        customerCustomValidation.validate(customerDto, bindingResult);
        getLogger().info("Inside customerRegistrationSave method");
        if (bindingResult.hasErrors()) {

            return "customerRegistrationPage";
        } else {
            customerService.customerRegistrationSave(customerDto);

            return "loginPage";
        }
    }

    @RequestMapping(value = "/getCustomerDetailsByEmail", method = RequestMethod.GET)
    public String getCustomerDetailsByEmail(Principal principal, Model model) {
        CustomerDto customerDto = customerService.getCustomerDetailsByEmail(principal.getName());
        model.addAttribute("customerDto", customerDto);

        return "getCustomerDetailsByEmailPage";
    }

    @RequestMapping(value = "/editCustomerDetails", method = RequestMethod.GET)
    public String editCustomerDetails(Principal principal, Model model) {
        CustomerDto customerDto = customerService.getCustomerDetailsByEmail(principal.getName());
                model.addAttribute("customerDto", customerDto);

                return "editCustomerDetailsPage";
    }

    @RequestMapping(value = "/updateCustomerDetails", method = RequestMethod.POST)
    public String updateCustomerDetails(Principal principal, @ModelAttribute CustomerDto customerDto, BindingResult bindingResult) {
        customerDto.setEmail(principal.getName());
        customerCustomValidation.validate(customerDto, bindingResult);
        if (bindingResult.hasErrors()) {
            return "editCustomerDetailsPage";
        } else {
            customerService.updateCustomerDetails(customerDto);

            return "redirect:/getCustomerDetailsByEmail";
        }
    }

    @RequestMapping(value = "/deleteCustomerDetails", method = RequestMethod.GET)
    public String deleteCustomerDetails(@RequestParam String email) {
        customerService.deleteCustomerDetails(email);

        return "redirect:/login";
    }

    @RequestMapping(value = "/checkOut", method = RequestMethod.GET)
    public String checkOut(Principal principal, Model model) {
        CustomerDto customerDto = customerService.getCustomerDetailsByEmail(principal.getName());
        model.addAttribute("customerDto", customerDto);

        return "checkOutPage";
    }

    @RequestMapping(value = "/checkOutSave", method = RequestMethod.POST)
    public String checkOutSave(@SessionAttribute(required = false) BookWarehouseDto bookWarehouse, @Valid @ModelAttribute CustomerDto customerDto, BindingResult bindingResult, Model model, Principal Principal) {
        try {
            if (bindingResult.hasErrors()) {
                return "checkOutPage";
            } else {
                customerDto.setProductId(bookWarehouse.getBookId());
                customerService.checkOutSave(customerDto);

                emailService.sendEmail(bookWarehouse.getBookId(), Principal.getName(), customerDto.getAddressLine1(), customerDto.getOrderId(), customerDto.getCod());

                long orderId = customerDto.getOrderId();
                model.addAttribute("orderId", orderId);

                return "redirect:/placeOrderDetails/{orderId}";
            }
        } catch (NullPointerException e) {
            getLogger().error("Execption in checkOutSave", e);

            return "errorPage";
        }
    }

    @RequestMapping(value = "/placeOrderDetails/{orderId}", method = RequestMethod.GET)
    public String placeOrder(@SessionAttribute(required = false) BookWarehouseDto bookWarehouseDto, @PathVariable String orderId, @ModelAttribute CustomerDto customerDto, Model model) {
       try {
           model.addAttribute("bookWarehouseDto", bookWarehouseDto);

           CustomerDto customerDtoObj = customerService.placeOrderDetails(orderId);
           if (customerDtoObj != null) {
               model.addAttribute("customerDto", customerDtoObj);

               return "placeOrderPage";
           }
       }catch (NullPointerException e){
           getLogger().error("Execption in placeOrderDetails", e);

           return "errorPage";
       }
        return "errorPage";
    }

    public static Logger getLogger() {
        return logger;
    }

}
