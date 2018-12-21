package com.sierp.web.domain.business.service;

import java.util.Date;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sierp.web.controller.business.request.CompanyRegisterRequest;
import com.sierp.web.controller.business.request.CompanyRegisterRequestStaff;
import com.sierp.web.domain.business.dao.CompanyDao;
import com.sierp.web.domain.business.model.Company;
import com.sierp.web.domain.business.model.CompanyStaff;
import com.sierp.web.domain.business.model.CustomerManager;

@Service
@Slf4j
public class CompanyRegisterService {

	@Autowired CompanyDao companyDao;
	
	@Transactional(rollbackFor = {Exception.class})
	public void registerCompanyProc(CompanyRegisterRequest request, CustomerManager manager) {
		
		log.debug("업체 등록 정보 = {}", request.toString());
		
		Company company = registerCompany(request, manager);
		
		registerCompanyStaff(company.getCompanySeq(), request.getStaffs(), manager);
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	private Company registerCompany(CompanyRegisterRequest request, CustomerManager manager) {
		
		Company company = new Company();
	 
		company.setCustomerSeq(manager.getCustomerSeq());
		company.setCompanyName(request.getName());
		company.setBizNo(request.getBizNo());
		company.setSido(request.getSido());
		company.setSiGunGu(request.getSigungu());
		company.setDetailAddr(request.getAddrDetail());
		company.setCustomerMemo(request.getCustomerMemo());
		company.setRegisterManagerId(manager.getId());
		company.setRegisterYmdt(new Date());
		
		companyDao.insertCompany(company);
		return company;
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	private void registerCompanyStaff(int companySeq, List<CompanyRegisterRequestStaff> staffs, CustomerManager manager) {
		
		Date registerYmdt = new Date();
		for (CompanyRegisterRequestStaff staff : staffs) {
			
			CompanyStaff companyStaff = new CompanyStaff();
			companyStaff.setCompanySeq(companySeq);
			companyStaff.setName(staff.getName());
			String phoneNo = StringUtils.isNotEmpty(staff.getPhoneNo()) ? staff.getPhoneNo().replace("-", "") : null;
			companyStaff.setPhoneNo(phoneNo);
			companyStaff.setCompanyPhoneNo(staff.getCompanyPhoneNo());
			companyStaff.setEmail(staff.getEmail());
			
			companyStaff.setPosition(staff.getPosition());
			companyStaff.setPart(staff.getPart());
			companyStaff.setCustomerMemo(staff.getMemo());
			companyStaff.setRegisterYmdt(registerYmdt);
			companyStaff.setRegisterManagerId(manager.getId());
			companyDao.insertCompanyStaff(companyStaff);
		}
	}
}