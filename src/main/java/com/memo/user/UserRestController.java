package com.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.memo.common.EncryptUtils;
import com.memo.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	/** <== 이거 꿀팁
	 * 아이디 중복확인 체크
	 * @param loginId
	 * @return 
	 */
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
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
				@RequestParam("loginId") String loginId
				, @RequestParam("password") String password
				, @RequestParam("name") String name
				, @RequestParam("email") String email
			) {
		// 비밀번호 해싱 (암호화 복호화가 불가능한) MD5, SHA-512/384
		String encryptPassword = EncryptUtils.md5(password);
		
		// DB user insert
		
		
		// 응답값 생성 후 리턴
	}
}
