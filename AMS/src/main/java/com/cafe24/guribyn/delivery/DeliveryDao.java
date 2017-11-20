package com.cafe24.guribyn.delivery;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class DeliveryDao {
	
	private final String NS="com.cafe24.guribyn.delivery.DeliveryMapper";
	@Autowired
	SqlSessionTemplate sst;
	
	//운송 등록 처리
	public int DeliveryAdd(Delivery delivery) {
		return sst.insert(NS+".deliveryAdd", delivery);
	}
}
