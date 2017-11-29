package com.cafe24.guribyn.clean;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CleanDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NS="com.cafe24.guribyn.clean.CleanMapper";
	
	//청소시작
	public int cleanStart(Clean clean) {
		System.out.println("---청소시작등록---------from dao");
		return sqlSessionTemplate.insert(NS+".insertCleanStart", clean);
	}
	//청소시작 시간 불러오기
	public Clean cleanStartTime(Clean clean) {
		System.out.println("---청소시작시간 불러오기---------from dao");
		return sqlSessionTemplate.selectOne(NS+".selectCleanStart", clean);
	}
	//청소중인 목록
	public List<Clean> cleanList(){
		System.out.println("---청소중인목록 불러오기---------from dao");
		System.out.println(sqlSessionTemplate.selectList(NS+".selectAllClean"));
		return sqlSessionTemplate.selectList(NS+".selectAllClean");
	}
}
