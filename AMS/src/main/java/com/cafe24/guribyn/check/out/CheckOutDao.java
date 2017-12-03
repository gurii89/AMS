package com.cafe24.guribyn.check.out;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CheckOutDao {
	
	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.check.out.CheckOutMapper.";
	
	// 체크아웃 등록
	public void checkOutAdd(CheckOut checkOut) {
		SST.insert(NS+"checkOutAdd", checkOut);
	}

}
