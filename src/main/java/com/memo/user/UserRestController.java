package com.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.memo.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
				@RequestParam("loginId") String loginId
			){
		//로그인 아이디 중복 여부 DB 조회
		//userBO.existLoginId(loginId);
		// 아레에 그냥 포함 하였다.
		
		//중복 여부에 대한 결과 Map 생성
		Map<String, Object> result = new HashMap<>();
		result.put("result", userBO.existLoginId(loginId));
		
		// return map
		return result;
	}
	
}
