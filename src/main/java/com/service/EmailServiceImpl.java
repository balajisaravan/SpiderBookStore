package com.service;

import com.controller.CustomerController;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailServiceImpl implements EmailService {

    private JavaMailSender javaMailSender;

    private static final Logger logger = LogManager.getLogger(CustomerController.class);

    @Override
    public void sendEmail(int bookId, String emailId, String addressLine1, long orderId, String cod) {
        try {
            SimpleMailMessage mail = new SimpleMailMessage();
            mail.setTo(emailId);
            mail.setSubject("Your Order From Spider Book store");
            mail.setText("Hi " + emailId + " your order will be delivered by 4 days " + " payment is " + cod);

            getJavaMailSender().send(mail);
        } catch (MailAuthenticationException e){
            BasicConfigurator.configure();
            getLogger().info("Inside sendEmail method");
        }
    }

    public JavaMailSender getJavaMailSender() {
        return javaMailSender;
    }

    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public static Logger getLogger() {
        return logger;
    }
}
