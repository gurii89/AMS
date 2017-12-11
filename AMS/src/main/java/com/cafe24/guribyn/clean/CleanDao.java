package com.cafe24.guribyn.clean;

import java.util.List;
import java.util.Map;

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
		return sqlSessionTemplate.selectList(NS+".selectCleanList");
	}
	//청소 총카운트
	public int cleanAllCount() {
		System.out.println("---청소 총 카운트---------from dao");
		return sqlSessionTemplate.selectOne(NS+".selectCleanCount");
	}
	//청소 페이징
	public List<Clean> cleanPageing(Map<String, String> map){
		System.out.println("---청소 페이징---------from dao");
		return sqlSessionTemplate.selectList(NS+".selectCleanLimit", map);
	}
}
