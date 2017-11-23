package com.cafe24.guribyn.delivery;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeliveryService {
	
	@Autowired
	DeliveryDao deliveryDao;
	
	@Autowired
	HttpSession session;
	
	
	//운송 등록 처리
	public void DeliveryAddPro(Delivery delivery) {
		deliveryDao.deliveryAddPro(delivery);
	
	}
	//운송 전체 리스트
	public List<Delivery> deliveryList() {
	return deliveryDao.deliveryList();	
	}
	
	//운송 세션 설정
	public String DeliverySession() {
		session.setAttribute("top", "delivery");
		return "";
	}
}
