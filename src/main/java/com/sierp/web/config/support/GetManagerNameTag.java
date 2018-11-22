package com.sierp.web.config.support;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;





import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter; 

import com.google.common.collect.Maps;
import com.sierp.web.config.WebRootConfig;
import com.sierp.web.domain.company.dao.CustomerDao;
import com.sierp.web.domain.company.model.Customer;
import com.sierp.web.domain.company.model.CustomerManager;

/**
 *
 */
@Component
public class GetManagerNameTag extends SimpleTagSupport {
	
	private static CustomerDao customerDao; //Rooot에서 주입함
	
	private static Map<String, List<CustomerManager>> managers = Maps.newHashMap();
    
	@Getter @Setter private String customerCode;
	@Getter @Setter private String managerId;
	 
	public GetManagerNameTag() {
		customerDao = WebRootConfig.getBean(CustomerDao.class);
	}
	
	public void doTag() throws JspException, IOException {
		
		if (!managers.containsKey(customerCode)) {
			
			Customer customer = customerDao.selectCustomerByCode(customerCode);
			
			List<CustomerManager> customerManager = customerDao.selectCustomerManagerList(customer.getCustomerSeq());
			managers.put(customerCode, customerManager);
		}
		
		String name = "";
		
		for (CustomerManager manager : managers.get(customerCode)) {
			if (StringUtils.equals(managerId, manager.getId())) {
				name = manager.getName();
				break;
			}
		}
		
		getJspContext().getOut().write(name);
 
	 
	}
	
	
}
