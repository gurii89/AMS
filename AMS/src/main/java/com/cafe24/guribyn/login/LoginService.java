package com.cafe24.guribyn.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.login.LoginHistory;

@Service
public class LoginService {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private LoginDao loginDao;
	
	public int logHistory(EmployeeTest loginemployee) {
		String getUserIp = loginDao.getIpAddress(request);
		LoginHistory lh = new LoginHistory();
		lh.seteId(loginemployee.geteId());
		lh.setlIp(getUserIp);
		
		return loginDao.insertloginHistory(lh);
	}
}
