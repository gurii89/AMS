package com.cafe24.guribyn.guest;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDao {

	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.guest.GuestMapper.";
	
	// 전체 고객
	public List<Guest> guestList(){
		return SST.selectList(NS+"guestList");
	}
	
	// 고객 수
	public int guestCount() {
		return SST.selectOne(NS+"guestCount");
	}
	
	// 고객 등록
	public void guestAddPro(Guest guest) {
		SST.insert(NS+"guestAdd", guest);
	}
}
