package com.service;

import com.dao.CustomerDaoImpl;
import com.dao.ForgetPasswordDao;
import com.dto.ForgetPasswordDto;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class ForgetPasswordServiceImpl implements ForgetPasswordService {

    private ForgetPasswordDao forgetPasswordDao;

    @Override
    public int forgetPasswordSave(ForgetPasswordDto forgetPasswordDto) {

        return getForgetPasswordDao().forgetPasswordSave(forgetPasswordDto);
    }

    public ForgetPasswordDao getForgetPasswordDao() {
        return forgetPasswordDao;
    }

    public void setForgetPasswordDao(ForgetPasswordDao forgetPasswordDao) {
        this.forgetPasswordDao = forgetPasswordDao;
    }

}
