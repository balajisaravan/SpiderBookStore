package com.customValidation;

import com.dto.CustomerDto;
import com.service.CustomerService;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class CustomerCustomValidation implements Validator {

    private static final Logger logger = LogManager.getLogger(CustomerCustomValidation.class);

    @Override
    public boolean supports(Class<?> clazz) {

        return CustomerDto.class.equals(clazz);
    }

    @Override
    public void validate(Object customerDto, Errors bindingResult) {
        BasicConfigurator.configure();
        getLogger().info("Inside validate method");

        String firstName = ((CustomerDto) customerDto).getFirstName();

        if (firstName.isEmpty()) {
            bindingResult.rejectValue("firstName", "customerDto.firstName");
        } else if (!firstName.matches("[A-Za-z0-9_ ]+")) {
            bindingResult.rejectValue("firstName", "CustomerDto.firstName.invalid");
        }

        String email = ((CustomerDto) customerDto).getEmail();

        if (email.isEmpty()) {
            bindingResult.rejectValue("email", "customerDto.email");
        } else if(!email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")){
            bindingResult.rejectValue("email", "customerDto.emailProper");
        }

        String password = ((CustomerDto) customerDto).getPassword();

        if (password.isEmpty()) {
            bindingResult.rejectValue("password", "customerDto.password");
        }

        String rePassword = ((CustomerDto) customerDto).getRePassword();

        if (rePassword.isEmpty()) {
            bindingResult.rejectValue("rePassword", "customerDto.rePassword");
        }

        if (!password.equals(rePassword)) {
            bindingResult.rejectValue("password", "customerDto.checkingPassword");
        }

        if (!rePassword.equals(password)) {
            bindingResult.rejectValue("rePassword", "customerDto.checkingRePassword");
        }

        String contact = ((CustomerDto) customerDto).getContact();

        if (contact.isEmpty()) {
            bindingResult.rejectValue("contact", "customerDto.contact");
        } else if (!contact.matches("^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$")) {
            bindingResult.rejectValue("contact", "customerDto.contact.invalid");
        }

        String dob = ((CustomerDto) customerDto).getDob();

        if (dob.isEmpty()) {
            bindingResult.rejectValue("dob", "customerDto.dob");
        }

        if (!dob.contains("-")) {
            bindingResult.rejectValue("dob", "customerDto.dob-");
        }

        String addressLine1 = ((CustomerDto) customerDto).getAddressLine1();

        if (addressLine1.isEmpty()) {
            bindingResult.rejectValue("addressLine1", "customerDto.addressLine1");
        }

        String city = ((CustomerDto) customerDto).getCity();

        if (city.isEmpty()) {
            bindingResult.rejectValue("city", "customerDto.city");
        }

        String state = ((CustomerDto) customerDto).getState();

        if (state.isEmpty()) {
            bindingResult.rejectValue("state", "customerDto.state", "*Required");
        }

        String pinCode = ((CustomerDto) customerDto).getPinCode();

        if (pinCode.isEmpty()) {
            bindingResult.rejectValue("pinCode", "customerDto.pinCode", "*Required");
        } else if (!pinCode.matches("^[1-9][0-9]{5}$")) {
            bindingResult.rejectValue("pinCode", "CustomerDto.pincode.invalid");
        }

    }

    public static Logger getLogger() {
        return logger;
    }
}
