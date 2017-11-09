package com.cafe24.guribyn.login;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.login.Login;

@Service
public class LoginService {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private LoginDao loginDao;
	
	public int logHistory(Login loginforcheck) {
		String getUserIp = loginDao.getIpAddress(request);
		
		Login lh = new Login();
		lh.seteId(loginforcheck.geteId());
		lh.setlCheack(loginforcheck.getlCheack());
		lh.setlIp(getUserIp);
		
		return loginDao.insertloginHistory(lh);
	}
}
