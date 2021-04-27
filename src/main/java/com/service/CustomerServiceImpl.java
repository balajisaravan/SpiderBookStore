package com.service;

import com.dao.CustomerDao;
import com.dto.CustomerDto;

import java.security.Principal;
import java.util.Random;

public class CustomerServiceImpl implements CustomerService {

    private String roles;
    private CustomerDao customerDao;

    @Override
    public CustomerDto getFirstName(Principal principal) {

        return getCustomerDao().getFirstName(principal);
    }

    @Override
    public int customerRegistrationSave(CustomerDto customerDto) {
        customerDto.setRole(getRoles());

        return getCustomerDao().customerRegistrationSave(customerDto);
    }

    @Override
    public CustomerDto getCustomerDetailsByEmail(String email) {
        return getCustomerDao().getCustomerDetailsByEmail(email);
    }

    @Override
    public int updateCustomerDetails(CustomerDto customerDto) {

        return getCustomerDao().updateCustomerDetails(customerDto);
    }

    @Override
    public int deleteCustomerDetails(String email) {

        return getCustomerDao().deleteCustomerDetails(email);
    }

    @Override
    public int checkOutSave(CustomerDto customerDto) {
        Random random = new Random();
        customerDto.setOrderId(random.nextLong());

        return getCustomerDao().checkOutSave(customerDto);
    }

    @Override
    public CustomerDto placeOrderDetails(String orderId) {

        return getCustomerDao().placeOrderDetails(orderId);
    }

    @Override
    public int ifSameEmail(CustomerDto customerDto) {

        return getCustomerDao().ifSameEmail(customerDto);
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public CustomerDao getCustomerDao() {
        return customerDao;
    }

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

}
