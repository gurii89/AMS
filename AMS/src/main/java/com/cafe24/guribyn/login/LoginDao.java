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
	
	//�α���
	public EmployeeTest login(EmployeeTest employeetest) {
		return sqlSessionTemplate.selectOne(NS+".login", employeetest);
	}
	
	//�α��� �̷�
	public int insertloginHistory(LoginHistory loginHistory) {
		return sqlSessionTemplate.insert(NS+".insertloginHistory", loginHistory);
	}
	
	//Ŭ���̾�Ʈ ipüũ
	public String getIpAddress(HttpServletRequest request) {
		String userIp = request.getHeader("X-Forwarded-For");
        if ( userIp == null  || "".equals(userIp) ) {
        	userIp = request.getRemoteAddr();
        }
        if ( userIp == null  || "".equals(userIp) ) {
            return "";
        }
        System.out.println(userIp+"<------------����� ip");
        
        String getUserIp = userIp;
        return getUserIp;
	}
}
