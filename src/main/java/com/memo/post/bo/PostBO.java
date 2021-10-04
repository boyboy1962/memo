package com.memo.post.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.memo.common.FileManagerService;
import com.memo.post.dao.PostDAO;
import com.memo.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public List<Post> getPostList(int userId) {
		return postDAO.selectPostList(userId);
	}

	public int createPost(Integer userId, String userLoginId, String subject, String content, MultipartFile file) {
		String imgUrl = null;
		
		if (file != null) {
			// 이미지 변환하는 거 만들기 새로운 클라스를 만들어서 쓴다.
			try {
				imgUrl = fileManagerService.saveFile(userLoginId, file);
			} catch (IOException e) {
				imgUrl = null;
			}
		}
		
		return postDAO.insertPost(userId, subject, content, imgUrl);
	}
}
