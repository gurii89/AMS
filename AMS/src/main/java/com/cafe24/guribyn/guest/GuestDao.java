package com.cafe24.guribyn.guest;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDao {

	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.guest.GuestMapper.";
	
	// 전체 고객(+페이징)
	public List<Guest> guestList(Map<String, Integer> map){
		return SST.selectList(NS+"guestList", map);
	}
	
	// 고객 수
	public int guestCount() {
		return SST.selectOne(NS+"guestCount");
	}
	
	// 고객 등록
	public void guestAddPro(Guest guest) {
		SST.insert(NS+"guestAdd", guest);
	}
	
	// 고객 단일 select
	public Guest guestOne(int gCode) {
		return SST.selectOne(NS+"guestOne", gCode);
	}
	
	// 고객 수정 처리
	public void guestMod(Guest guest) {
		SST.update(NS+"guestMod", guest);
	}
}
