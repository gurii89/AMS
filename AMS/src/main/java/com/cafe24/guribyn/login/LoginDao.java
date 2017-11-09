package com.cafe24.guribyn.login;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NS="com.cafe24.guribyn.login.LoginMapper";
	
	//로그인
	public Login login(Login login) {
		return sqlSessionTemplate.selectOne(NS+".login", login);
	}
	
	//로그인 이력 저장
	public int insertloginHistory(Login loginHistory) {
		return sqlSessionTemplate.insert(NS+".insertloginHistory", loginHistory);
	}
	
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
	
	//로그인 인아웃 체크1
	public Login inCheck(Login inoutcheck) {
		inoutcheck.setlCheack("IN");
		return inoutcheck;
		}
	//로그인 인아웃 체크2
	public Login outCheck(Login inoutcheck) {
		inoutcheck.setlCheack("OUT");
		return inoutcheck;
		}
}
