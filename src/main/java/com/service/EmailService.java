package com.service;

public interface EmailService {


    void sendEmail(int bookId, String emailId, String addressLine1, long orderId, String cod);
}
