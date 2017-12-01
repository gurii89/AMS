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
		return sqlSessionTemplate.selectList(NS+".selectAllClean");
	}
	//청소완료
	public int cleanEnd(String roomCode) {
		System.out.println("---청소완료---------from dao");
		return sqlSessionTemplate.update(NS+".UpdateCleanEnd", roomCode);
	}
	//청소완료 리스트
	public List<Clean> cleanEndList(){
		System.out.println("---청소완료리스트---------from dao");
		System.out.println ("테스트"+sqlSessionTemplate.selectList(NS+".selectCleanList"));
		return sqlSessionTemplate.selectList(NS+".selectCleanList");
	}
}
