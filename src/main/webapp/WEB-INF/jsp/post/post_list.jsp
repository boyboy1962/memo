<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div>
	<h1>글 목록</h1>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성날짜</th>
				<th>수정날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${postList}" var="post">
				<tr>
					<th>${post.id}</th>
					<th><a href="/post/post_detail_view?postId=${post.id}">${post.content}</a></th>
					<th>
						<%-- ${post.createdAt} --%>
						<%-- Date 객체로 내려온 값을 String Format으로 변경해서 출력 --%>
						<fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/> 
					</th>
					<th>
						<%-- ${post.updatedAt} --%>
						<%-- Date 객체로 내려온 값을 String Format으로 변경해서 출력 --%>
						<fmt:formatDate value="${post.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" var="updatedAt"/>
						${updatedAt}
					</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="d-flex justify-content-center">
		<c:if test="${prevId ne 0}">
			<a href="/post/post_list_view?prevId=${prevId}">&lt;&lt; 이전 </a>
		</c:if>
		<c:if test="${nextId ne 0}">
		<a href="/post/post_list_view?nextId=${nextId}" class="pl-5">다음 &gt;&gt;</a>
		</c:if>
	</div>
	
	<div class="d-flex justify-content-end">
		<a href="/post/post_create_view" class="btn btn-primary">글쓰기</a>
	</div>
	
</div>