package com.memo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.memo.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(
				@RequestParam("subject") String subject
				, @RequestParam("content") String content
				, @RequestParam(value = "file", required = false) MultipartFile file
				, HttpServletRequest request
			) {
		
		// session에서 유저 id를 가져온다.
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		/*
		 * if (userId == null) {
		 * 
		 * }
		 */
		
		// DB에 인서트 BO -> 유저 id, subject, content, file
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		int row = postBO.createPost(userId, userLoginId, subject, content, file);
		if (row > 0) {
			result.put("result", "success");
		}
				
		// 결과값 response
		return result;
	}
	
	@PutMapping("/update")
	public Map<String, Object> update(
				@RequestParam("postId") int postId
				, @RequestParam("subject") String subject
				, @RequestParam("content") String content
				, @RequestParam(value="file", required=false) MultipartFile file 
				, HttpServletRequest request
			) {

		// session에서 유저 id를 가져온다.
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("userLoginId");
		
		// DB update
		postBO.updatePost(loginId, postId, subject, content, file);
		
		// 응답값 세팅
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
}
