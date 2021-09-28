package com.memo.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.memo.test.bo.TestBO;

@Controller
public class TestController {
	
	@Autowired
	private TestBO testBO;

	@ResponseBody
	@RequestMapping("/test1")
	public String test () {
		return "hello masterJ!!";
	}
	
	//DB 연동 테스트
	@RequestMapping("/test2")
	@ResponseBody
	public List<Map<String, Object>> test2(){//임시로 map으로 만들었다. 
		return testBO.getUserList();
	}
	
	// jsp 연동 테스트
	@RequestMapping("/test3")
	public String test3() {
		return "template/layout";
	}
}
