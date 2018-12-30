package com.sierp.web.controller.recruit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/recruit/jobPosition")
public class RecruitJobPositionController {

	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "recruit/jobPosition/main";
	}
}