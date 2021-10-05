package com.memo.post.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.memo.common.FileManagerService;
import com.memo.post.dao.PostDAO;
import com.memo.post.model.Post;

@Service
public class PostBO {

	private Logger logger = LoggerFactory.getLogger(PostBO.class);
	
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
	
	public Post getPostByPostId(int postId) {
		return postDAO.selectPostByPostId(postId);
	}

	public void updatePost(String loginId, int postId, String subject, String content, MultipartFile file) {
		
		// postId로 게시물이 있는지 확인(파일을 삭제르 위한용)
		Post post = getPostByPostId(postId);
		if (post == null) {
			logger.error("[글 수정] post is null. postId:{}", postId);
			return;
		}
		
		// file이 있으면 업로드 후 imagePath를 얻어온다.
		String imgUrl = null;
		if (file != null) {
			// 파일 업로드
			try {
				imgUrl = fileManagerService.saveFile(loginId, file);
				
				// 기존에 있던 파일 제거 - imagePath가 존재(업로드 성공) && 기존에 파일이 있으면
				if (imgUrl != null && post.getimgUrl() != null) {
					// 업로드가 실패할 수 있으므로 업로드 성공 후 제거
					fileManagerService.deleteFile(post.getimgUrl());
				}
			} catch (IOException e) {
				
			}
			
		}
		
		// DB update
		
		
		
	}
}
