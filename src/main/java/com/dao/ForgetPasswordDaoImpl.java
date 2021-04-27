package com.dao;

import com.dto.ForgetPasswordDto;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class ForgetPasswordDaoImpl implements ForgetPasswordDao {

    private JdbcTemplate jdbcTemplate;

    private static final Logger logger = LogManager.getLogger(ForgetPasswordDaoImpl.class);

    @Override
    public int forgetPasswordSave(ForgetPasswordDto forgetPasswordDto) {
        BasicConfigurator.configure();
        String sql = "update customerdto set password='" + forgetPasswordDto.getPassword() + "',rePassword='" + forgetPasswordDto.getRePassword() + "' where email='"
                + forgetPasswordDto.getEmail() + "'";
        try {
            return getJdbcTemplate().update(sql);
        } catch (DataAccessException e) {
            getLogger().error("Execption in getFirstName", e);
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
