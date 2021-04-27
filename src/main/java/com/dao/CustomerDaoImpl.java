package com.dao;

import com.dto.CustomerDto;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.security.Principal;

public class CustomerDaoImpl implements CustomerDao {

    private JdbcTemplate jdbcTemplate;

    private static final Logger logger = LogManager.getLogger(CustomerDaoImpl.class);

    @Override
    public CustomerDto getFirstName(Principal principal) {
        BasicConfigurator.configure();
        String sql = "select firstName from customerdto where email = '" + principal.getName() + "' ";
        try {
            return (CustomerDto) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(CustomerDto.class));
        } catch (DataAccessException e) {
            getLogger().error("Execption in getFirstName", e);
        }
        return null;
    }

    @Override
    public int customerRegistrationSave(CustomerDto customerDto) {
        String sql = "insert into customerdto(firstName,lastName,email,password,rePassword,contact,dob,addressLine1,addressLine2,city,state,pinCode,role) values('"
                + customerDto.getFirstName() + "','" + customerDto.getLastName() + "','" + customerDto.getEmail() + "','"
                + customerDto.getPassword() + "','" + customerDto.getRePassword() + "','" + customerDto.getContact() + "','"
                + customerDto.getDob() + "','" + customerDto.getAddressLine1() + "','" + customerDto.getAddressLine2() + "','"
                + customerDto.getCity() + "','" + customerDto.getState() + "','" + customerDto.getPinCode() + "','"
                + customerDto.getRole() + "')";
        try {
            return getJdbcTemplate().update(sql);
        } catch (DataAccessException e) {
            getLogger().error("Execption in customerRegistrationSave", e);
        }
        return 0;
    }

    @Override
    public CustomerDto getCustomerDetailsByEmail(String email) {
        String sql = "select * from customerdto where email = ?";
        try {
            return getJdbcTemplate().queryForObject(sql, new Object[]{email},
                    new BeanPropertyRowMapper<CustomerDto>(CustomerDto.class));
        } catch (DataAccessException e) {
            getLogger().error("Execption in getCustomerDetailsByEmail", e);
        }
        return null;
    }

    @Override
    public int updateCustomerDetails(CustomerDto customerDto) {
        String sql = "update customerdto set firstName='"+customerDto.getFirstName()+"', lastName='" + customerDto.getLastName() + "', email='" + customerDto.getEmail()
                + "', password='" + customerDto.getPassword() + "',rePassword='" + customerDto.getRePassword() + "',contact='"
                + customerDto.getContact() + "',dob='" + customerDto.getDob() + "',addressLine1='" + customerDto.getAddressLine1() + "',addressLine2='"
                + customerDto.getAddressLine1() + "',city='" + customerDto.getCity() + "',state='" + customerDto.getState()
                + "',pinCode='" + customerDto.getPinCode() + "' where email='"
                + customerDto.getEmail() + "'";
        try {
            return getJdbcTemplate().update(sql);
        } catch (DataAccessException e) {
            getLogger().error("Execption in updateCustomerDetails", e);
        }
        return 0;
    }

    @Override
    public int deleteCustomerDetails(String email) {
        String sql = "delete from customerdto where email ='" + email + "' ";
        try {
            return jdbcTemplate.update(sql);
        } catch (DataAccessException e) {
            getLogger().error("Execption in deleteCustomerDetails", e);
        }
        return 0;
    }

    @Override
    public int checkOutSave(CustomerDto customerDto) {
        String sql = "insert into placeOrder(firstName,lastName,email,addressLine1,city,state,pinCode,cod,orderId,ProductId) values('"
                + customerDto.getFirstName() + "','" + customerDto.getLastName() + "','" + customerDto.getEmail() + "','"
                + customerDto.getAddressLine1() + "','" + customerDto.getCity() + "','" + customerDto.getState() + "','"
                + customerDto.getPinCode() + "','" + customerDto.getCod() + "', " + customerDto.getOrderId() + "," + customerDto.getProductId() + ")";
        try {
            return getJdbcTemplate().update(sql);
        } catch (DataAccessException e) {
            getLogger().error("Execption in checkOutSave", e);
        }
        return 0;
    }

    @Override
    public CustomerDto placeOrderDetails(String orderId) {
        String sql = "select * from placeOrder where orderId = ?";
        try {
            return getJdbcTemplate().queryForObject(sql, new Object[]{orderId},
                    new BeanPropertyRowMapper<CustomerDto>(CustomerDto.class));
        }catch (DataAccessException e){
            getLogger().error("Execption in placeOrderDetails", e);
        }
        return null;
    }

    @Override
    public int ifSameEmail(CustomerDto customerDto) {
        String sql = "select count(*) from customerdto where email = '"+customerDto.getEmail()+"'";

        try {
            int count = jdbcTemplate.queryForObject(sql,Integer.class);
            if(count>0){
                return count;
            }
            return 0;
        } catch (DataAccessException e){
            getLogger().error("Execption in ifSameEmail", e);
        }
        return 0;
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public static Logger getLogger() {
        return logger;
    }

}
