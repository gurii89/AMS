package com.cafe24.guribyn.delivery;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDao {
	
	private final String NS="com.cafe24.guribyn.delivery.DeliveryMapper";
	@Autowired
	SqlSessionTemplate sst;
	
	//운송 등록 처리
	public int deliveryAddPro(Delivery delivery) {
		return sst.insert(NS+".deliveryAdd", delivery);
	}
	
	//운송 전체 리스트
	public List<Delivery> deliveryList() {
		return sst.selectList(NS+".deliveryList");
	}
	//운송 수정 폼 select
	public Delivery deliveryOne(int kCode) {
		return sst.selectOne(NS+".deliveryOne", kCode);
	}
	//운송 수정 처리
	public void deliveryMod(Delivery delivery) {
		sst.update(NS+"deliveryMod", delivery);
	}
}
