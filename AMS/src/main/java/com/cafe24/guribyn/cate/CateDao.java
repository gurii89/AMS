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
	
	// 카테고리 목록
	public List<Cate> cateList(Map<String, String> map){
		return SST.selectList(NS+"cateList", map);
	}
	
	// 카테고리 목록 카운트
	public int cateCount(Map<String, String> map) {
		return SST.selectOne(NS+"cateCount", map);
	}
	
	// 전체 select(폼 옵션 용 페이징x)
	public List<Cate> cateOption(){
		return SST.selectList(NS+"cateList");
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
	
	// RoomOption에서 이용 시작-----------------------------------------------------
	public List<Cate> cateSmallOnly(){
		return SST.selectList(NS+"cateRTlarge");
	}
	public List<Cate> cateSmallOnlyName(String small) {			
		return SST.selectList(NS+"cateOnlySmallName", small);
	}
	// RoomOption에서 이용 끝-----------------------------------------------------
}
