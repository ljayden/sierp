package com.sierp.web.controller.recruit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/recruit/suggestion")
public class RecruitSuggestionController {

	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "recruit/suggestion/main";
	}
}