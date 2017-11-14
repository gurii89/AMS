package com.cafe24.guribyn.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.guribyn.login.Login;

@Service
public class LoginService {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	HttpSession session;
	
	//사용자 ip 체크
	public String getIpAddress(HttpServletRequest request) {
		String userIp = request.getHeader("X-Forwarded-For");
        if ( userIp == null  || "".equals(userIp) ) {
        	userIp = request.getRemoteAddr();
        }
        if ( userIp == null  || "".equals(userIp) ) {
            return "";
        }
        System.out.println(userIp+"<------------유저 ip");
        
        String getUserIp = userIp;
        return getUserIp;
	}
	
	//로그인 이력 저장
	public int logHistory(Login loginfor) {
		String getUserIp = getIpAddress(request);
		
		Login lh = new Login();
		lh.seteId(loginfor.geteId());
		lh.setlCheack(loginfor.getlCheack());
		lh.setlIp(getUserIp);
		
		return loginDao.loginHistoryAdd(lh);
	}
	
	//로그인
	@Transactional
	public String login(Login login, HttpSession session) {
		Login loginfor = loginDao.login(login);
		System.out.println("---로그인정보--------->" + loginfor);
		
		if(loginfor == null) {
			System.out.println("---로그인실패");	
		}else {
			System.out.println("---로그인완료");

			loginfor.setlCheack("IN");
			logHistory(loginfor);
			
			System.out.println("---로그인이력 저장");
			
			//로그인 세션 정보 세팅
			session.setAttribute("loginfor", loginfor);
			session.setAttribute("top", "home");
		}
		return "redirect:/";
	}
	
	//로그아웃
	@Transactional
	public String logout(HttpSession session) {
		Login loginfor = (Login) session.getAttribute("loginfor");
		session.invalidate();
		System.out.println("---로그아웃 성공");
	
		loginfor.setlCheack("OUT");
		logHistory(loginfor);
			
		System.out.println("---로그아웃이력 저장");
	
		return "redirect:/";
	}
	
	//home 세션 설정
	public String HomeSesseion() {
		session.setAttribute("top", "home");
		return "";
	}
}
