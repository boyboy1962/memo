package com.memo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.memo.common.FileManagerService;
import com.memo.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private PermissionInterceptor interceptor; // 여기서의 에러는 dlsxjtpdjlw @Componet가 빠졌을 가능성이 있다.
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry
		.addInterceptor(interceptor)
		.addPathPatterns("/**")		//		/** 손주를 포함한 모든 디렉토리 확인
		.excludePathPatterns("/user/sign_out", "/static/**", "/error");	// 인터셉터를 안태울 path 설정.
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")	// http://localhost/images/qwer_160208950293/apple.png
		.addResourceLocations("file:///D:\\1. 장재훈\\6._spring_project\\1. MEMO\\memo_workspace\\images/"); //FileManagerService.FILE_UPLOAD_PATH);	// 실제 파일 저장 위치
	}
}
