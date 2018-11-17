package com.sierp.web.domain.common.service;

import java.security.MessageDigest;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sierp.web.domain.company.dao.CustomerDao;
import com.sierp.web.domain.company.model.Customer;
import com.sierp.web.domain.company.model.CustomerManager;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

@Service
public class LoginService {

	@Autowired CustomerDao customerDao;
	
	public final static String SESSION_MANAGER_ATTR_FIELD = "customerManager";
	public final static String SESSION_CUSTOM_ATTR_FIELD = "customer";
	
	public final static int SESSION_VALID_SEC = 60 * 60 * 1; //1시간 
	
	public JsonResult login(String customerCode, String id, String password, HttpSession session) {
		
		try {
			
			Customer customer = customerDao.selectCustomerByCode(customerCode);
			
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] encBytes =  digest.digest(password.getBytes("UTF-8"));
	        encBytes = Base64.encodeBase64(encBytes);
			CustomerManager cm = customerDao.selectCustomerManagerByIdPassword(customer.getCustomerSeq(), id, new String(encBytes));
			
			if (cm == null) {
				return JsonResults.fail(1001, "관리자 정보를 찾을 수 없습니다.");
				
			} else {
				BeanUtils.copyProperties(customer, cm);
				
				session.setAttribute(SESSION_MANAGER_ATTR_FIELD, cm);
				session.setAttribute(SESSION_CUSTOM_ATTR_FIELD, customer);
				session.setMaxInactiveInterval(SESSION_VALID_SEC);
				return JsonResults.success();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
