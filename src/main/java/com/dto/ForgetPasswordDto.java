package com.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class ForgetPasswordDto {

    @Email(message = "*Enter Proper Mail Id")
    private String email;

    @NotBlank(message = "*password should not be empty")
    private String password;

    @NotBlank(message = "*rePassword should not be empty")
    private String rePassword;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }
}
