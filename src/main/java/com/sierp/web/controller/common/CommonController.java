package com.sierp.web.controller.common;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

import lombok.Data;

@Controller
@RequestMapping(value = "/common")
public class CommonController {

	
	/**
	 * SiGunGu값 조회
	 */
	@RequestMapping(value = "/getSiGunGu", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult getSiGunGu(@RequestBody GetSiGunGuRequest request) {
		
		List<Map<String, String>> siGunGuList = Lists.newArrayList();
		for (SiGunGuType sigungu : SiGunGuType.getSiGunGu(request.getSido())) {
			Map<String, String> map = Maps.newHashMap();
			map.put("code", sigungu.name());
			map.put("description", sigungu.getDescription());
			
			siGunGuList.add(map);
		}
		
		return JsonResults.success(siGunGuList);
	}
	
	/**
	 * SiGunGu값 조회
	 */
	@RequestMapping(value = "/getAllSiGunGu", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult getAllSiGunGu() {
		
		List<Map<String, String>> siGunGuList = Lists.newArrayList();
		for (SiGunGuType sigungu : SiGunGuType.values()) {
			Map<String, String> map = Maps.newHashMap();
			map.put("code", sigungu.name());
			map.put("sido", sigungu.getSido().name());
			map.put("description", sigungu.getDescription());
			
			siGunGuList.add(map);
		}
		
		return JsonResults.success(siGunGuList);
	}
	
	@Data
	public static class GetSiGunGuRequest {
		
		private SidoType sido;
	}
}
