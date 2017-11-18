package com.cafe24.guribyn.extra;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExtraDao {
	
	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.extra.ExtraMapper.";

	// 서비스 등록
	public void extraAdd(Extra extra) {
		SST.insert(NS+"extraAdd", extra);
	}
	
	// 서비스 목록
	public List<Extra> extraList(){
		return SST.selectList(NS+"extraList");
	}
	
	// 서비스 분류에 맞는 서비스 목록
	public List<Extra> extraName(String cateCode){
		return SST.selectList(NS+"extraName", cateCode);
	}
}
