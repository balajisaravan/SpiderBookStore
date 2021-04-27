package com.service;

import com.dto.CustomerDto;

import java.security.Principal;

public interface CustomerService {

    /**
     * To get firstname
     * @param principal
     * @return
     */
    CustomerDto getFirstName(Principal principal);

    /**
     * To save customer details
     * @param customerDto
     * @return
     */
    int customerRegistrationSave(CustomerDto customerDto);

    /**
     * To get customer details by email
     * @param email
     * @return
     */
    CustomerDto getCustomerDetailsByEmail(String email);

    /**
     * To update customer details
     * @param customerDto
     * @return
     */
    int updateCustomerDetails(CustomerDto customerDto);

    /**
     * To delete customer details
     * @param email
     * @return
     */
    int deleteCustomerDetails(String email);

    /**
     * To place a order
     * @param customerDto
     * @return
     */
    int checkOutSave(CustomerDto customerDto);

    /**
     * To get details for showing order details
     * @param orderId
     * @return
     */
    CustomerDto placeOrderDetails(String orderId);

    /**
     * To get email if already exists
     * @param customerDto
     * @return
     */
    int ifSameEmail(CustomerDto customerDto);
}
