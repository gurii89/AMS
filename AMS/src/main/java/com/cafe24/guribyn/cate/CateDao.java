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
	
	// 카테고리 검색
	public List<Cate> cateSearch(Map<String, String> map){
		return SST.selectList(NS+"cateList", map);
	}
	
	// 카테고리 검색 결과 카운트
	public int cateSearchCount(Map<String, String> map) {
		return SST.selectOne(NS+"cateCount", map);
	}
	
	// 국적 select
	public List<Cate> cateNation(){
		return SST.selectList(NS+"cateNation");
	}
	
	// 전체 select(폼 옵션 용 페이징x)
	public List<Cate> cateOption(){
		return SST.selectList(NS+"cateList");
	}
	
	// 전체 select(카테고리 목록용, 페이징o)
	public List<Cate> cateList(Map<String, Integer> map){
		return SST.selectList(NS+"cateList", map);
	}
	
	// 페이징을 위한 전체 카운트
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
