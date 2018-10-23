package com.sierp.web.controller.resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/resource/freelancer")
public class ResourceFreeLancerController {

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "resource/freelancer/main";
	}
	
	@RequestMapping(value = "/registFreelancer", method = RequestMethod.GET)
	public String registFreelancer() {
		return "resource/freelancer/registFreelancer";
	}
	
}