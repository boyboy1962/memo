package com.memo.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@ResponseBody
	@RequestMapping("/test1")
	public String test () {
		return "hello masterJ!!";
	}
	
	@RequestMapping("/user/sign_in_view")
	public String signInView() {
		
		return "user/login";
	}
}
