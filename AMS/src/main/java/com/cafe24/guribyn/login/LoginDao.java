package com.cafe24.guribyn.login;

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
	public int loginHistoryAdd(Login loginHistory) {
		return sqlSessionTemplate.insert(NS+".insertloginHistory", loginHistory);
	}
}