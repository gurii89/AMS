package com.cafe24.guribyn.delivery;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.cate.CateService;
import com.cafe24.guribyn.login.Login;
import com.google.gson.Gson;

@Service
public class DeliveryService {

	@Autowired
	DeliveryDao deliveryDao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CateService cateService;
	
	// 운송 등록처리
	public void deliveryAddPro(Delivery delivery) {
		deliveryDao.deliveryAdd(delivery);
	}
	// 운송 세션 설정
	public String deliverySession() {
		session.setAttribute("top", "delivery");
		return "";
	}
	// 운송 전체리스트
	public List<Delivery> deliveryList() {
		return deliveryDao.deliveryList();
	}
	
	// 운송 수정 폼
	public Delivery deliveryModForm(int kCode) {
		return deliveryDao.deliveryOne(kCode);
	}
	
	//운송 수정 처리
	public void deliveryMod(Delivery delivery) {
		deliveryDao.deliveryMod(delivery);
	}
}