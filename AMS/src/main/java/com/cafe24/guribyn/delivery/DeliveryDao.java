package com.cafe24.guribyn.delivery;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDao {

	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.delivery.DeliveryMapper.";
	
	//운송 등록
	public void deliveryAdd(Delivery delivery) {
		SST.insert(NS+"deliveryAdd", delivery);
	}
	
	//운송 목록
	public List<Delivery> deliveryList() {
		return SST.selectList(NS+"deliveryList");
	}
	
	//운송 수정 폼
	public Delivery deliveryOne(String kCode) {
		return SST.selectOne(NS+"deliveryOne", kCode);
	}
	//운송 수정 처리
	public void deliveryMod(Delivery delivery) {
		SST.update(NS+"deliveryMod", delivery);
	}
	//분류에 맞는 k_code
	public List<Delivery> kName(String kCode) {
		return SST.selectList(NS+"kName", kCode);
	}
}
