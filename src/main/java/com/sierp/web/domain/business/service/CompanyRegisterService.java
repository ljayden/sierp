package com.sierp.web.domain.business.service;

import java.util.Date;
import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sierp.web.controller.business.request.CompanyRegisterRequest;
import com.sierp.web.controller.business.request.CompanyStaffRegisterRequest;
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
		
		Date registerYmdt = new Date();
		for (CompanyStaffRegisterRequest staff : request.getStaffs()) {
			registerCompanyStaff(company.getCompanySeq(), staff, manager, registerYmdt);
		}
	
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	private Company registerCompany(CompanyRegisterRequest request, CustomerManager manager) {
		
		Company company = new Company();
	 
		company.setCustomerSeq(manager.getCustomerSeq());
		company.setCompanyName(request.getName());
		company.setCompanyIntro(request.getCompanyIntro());
		company.setBizNo(request.getBizNo());
		company.setSido(request.getSido());
		company.setSigungu(request.getSigungu());
		company.setDetailAddr(request.getAddrDetail());
		company.setManagerMemo(request.getManagerMemo());
		company.setRegisterManagerId(manager.getId());
		
		Date registerYmdt = new Date();
		company.setRegisterYmdt(registerYmdt);
		company.setModifyManagerId(manager.getId());
		company.setModifyYmdt(registerYmdt);
		companyDao.insertCompany(company);
		return company;
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	public void registerCompanyStaff(int companySeq, CompanyStaffRegisterRequest staff, CustomerManager manager, Date registerYmdt) {

		CompanyStaff companyStaff = new CompanyStaff();
		companyStaff.setCompanySeq(companySeq);
		companyStaff.setName(staff.getName());
		String phoneNo = StringUtils.isNotEmpty(staff.getPhoneNo()) ? staff.getPhoneNo().replace("-", "") : null;
		companyStaff.setPhoneNo(phoneNo);
		companyStaff.setCompanyPhoneNo(staff.getCompanyPhoneNo());
		companyStaff.setEmail(staff.getEmail());
		
		companyStaff.setPosition(staff.getPosition());
		companyStaff.setPart(staff.getPart());
		companyStaff.setManagerMemo(staff.getMemo());
		companyStaff.setRegisterYmdt(registerYmdt);
		companyStaff.setRegisterManagerId(manager.getId());
		companyStaff.setModifyManagerId(manager.getId());
		companyStaff.setModifyYmdt(registerYmdt);
		companyDao.insertCompanyStaff(companyStaff);
	 
	}
}