package com.memo.like;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {
	
	@PostMapping("like/{postId}")
	public Map<String, Object> postLike(
				@PathVariable int postId
				, HttpServletRequest request
			) {
		
		//글번호, 유저번호
		
	}

}
