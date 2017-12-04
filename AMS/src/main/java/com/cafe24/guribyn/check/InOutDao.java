package com.cafe24.guribyn.check;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InOutDao {

	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.check.InOutMapper.";
	
	// 입퇴실 개수 확인
	public int inOutCount(Map<String, String> map) {
		return SST.selectOne(NS+"inOutCount", map);
	}
	
	// 입퇴실 목록
	public List<InOut> inOutList(Map<String, String> map){
		return SST.selectList(NS+"inOutList", map);
	}
	
}
