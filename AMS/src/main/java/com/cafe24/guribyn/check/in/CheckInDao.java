package com.cafe24.guribyn.check.in;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CheckInDao {

	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.check.in.CheckInMapper.";
	
	// 체크인 처리
	public void checkIn(CheckIn checkIn) {
		SST.insert(NS+"checkInAdd", checkIn);
	}
	
	// 체크인 된 호수 찾기
	public List<Integer> inSearchRoom(int booCode) {
		return SST.selectList(NS+"inSearchRoom", booCode);
	}
	
}
