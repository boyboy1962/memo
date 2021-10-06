package com.memo.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.memo.post.model.Post;


@Repository
public interface PostDAO {

	public List<Post> selectPostList(
				@Param("userId") int userId
				,@Param("direction") String direction
				,@Param("standardId") Integer standardId
				,@Param("limit") int limit
			);
	
	public int selectIdByUserIdAndSort(
				@Param("userId") int userId 
				,@Param("sort") String sort
			);

	public int insertPost(
				@Param("userId") Integer userId
				,@Param("subject") String subject
				,@Param("content") String content
				,@Param("imgUrl") String imageUrl
			);
	
	public Post selectPostByPostId(int id); // 이미 걸러진 포스트이기에 그냥 id(postId)로 충분하다.

	public void updatePost(
				@Param("id")int id 
				,@Param("subject")String subject 
				,@Param("content")String content
				,@Param("imgUrl")String imgUrl
			);

	public void deletePost(int id); // PK인 경우 by를 쓰지 않은 것이 추천한다.


}
