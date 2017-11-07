package com.cafe24.guribyn.cate;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

@Repository
public class CateDao {
	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.cate.CateMapper.";
	
	// 대분류 출력을 위한 select
	public List<Cate> cateAddList() {
		return SST.selectList(NS+"cateAddList");
	}
	
	// 대분류 선택 후 소분류 출력을 위한 select
	public String cateSmall(String large) {			
		List<Cate> list = SST.selectList(NS+"cateSmall", large);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println(result);
		return result;
	}
	
	// 카테고리명 중복검사를 위한 select, 중복없을시 ok 중복시 no
	public String cateNameCheck(String name) {
		if(SST.selectOne(NS+"cateNameCheck", name) == null) {
			return "ok";
		} else {
			return "no";
		}
	}
	
	// 카테고리 등록처리
	public void cateAdd(Cate cate) {
		System.out.println(cate);
		SST.insert(NS+"cateAdd", cate);
	}
}
