package com.memo.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.memo.post.model.Post;


@Repository
public interface PostDAO {

	public List<Post> selectPostList(int userId);

	public int insertPost(
			@Param("userId") Integer userId
			,@Param("subject") String subject
			,@Param("content") String content
			,@Param("imgUrl") String imageUrl
			);

}
