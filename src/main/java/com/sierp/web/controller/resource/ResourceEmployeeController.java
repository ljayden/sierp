package com.sierp.web.controller.resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/resource/employee")
public class ResourceEmployeeController {

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "resource/employee/main";
	}
}