package com.memo.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	/**
	 * 회원가입 페이지
	 * @param model
	 * @return
	 */
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "/user/sign_up");
		return"template/layout";
	}
	
	//@RequestMapping("sign_in_view")
	//public String 

	/**
	 * 로그인 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/login");
		return"template/layout";
	}
	
	/**
	 * 로그아웃
	 * @param request
	 * @return
	 */
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userNmae");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/sign_in_view";
	}
	
}
