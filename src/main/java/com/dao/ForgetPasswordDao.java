package com.dao;

import com.dto.ForgetPasswordDto;

public interface ForgetPasswordDao {
    int forgetPasswordSave(ForgetPasswordDto forgetPasswordDto);
}
