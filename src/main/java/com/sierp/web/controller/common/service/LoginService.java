package com.sierp.web.controller.common.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sierp.web.domain.company.dao.CustomerDao;
import com.sierp.web.domain.company.model.CustomerManager;

@Service
public class LoginService {

	@Autowired CustomerDao customerDao;
	
	
	public int login(String customerCode, String id, String password, HttpServletRequest request) {
		
		CustomerManager cm = customerDao.selectCustomerManagerByIdPassword(customerCode, id, password);
		
		if (cm == null) {
			//로그인 실패
		}
		
		return 1;
	}	
}
