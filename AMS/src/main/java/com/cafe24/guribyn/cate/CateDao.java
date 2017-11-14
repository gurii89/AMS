package com.cafe24.guribyn.cate;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CateDao {
	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.cate.CateMapper.";
	
	// 전체 select
	public List<Cate> cateList(){
		return SST.selectList(NS+"cateList");
	}
	
	public int cateCount() {
		return SST.selectOne(NS+"cateCount");
	}
	
	// 대분류 출력을 위한 select
	public List<Cate> cateLarge() {
		return SST.selectList(NS+"cateLarge");
	}
	
	// 대분류 선택 후 소분류 출력을 위한 select
	public List<Cate> cateSmall(String large) {			
		return SST.selectList(NS+"cateSmall", large);
	}
	
	// 카테고리명 중복검사를 위한 select
	public Cate cateNameCheck(Map<String, String> map) {
		return SST.selectOne(NS+"cateNameCheck", map);
	}
	
	// 카테고리 등록처리
	public void cateAddPro(Cate cate) {
		SST.insert(NS+"cateAdd", cate);
	}
}
