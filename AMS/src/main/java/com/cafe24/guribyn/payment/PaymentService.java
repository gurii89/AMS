package com.cafe24.guribyn.payment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.CommonService;
import com.cafe24.guribyn.login.Login;

@Service
public class PaymentService {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	PaymentDao paymentDao;
	
	@Autowired
	CommonService commonService;

	// 결제 등록 폼
	public void paymentAdd(Model model, int booCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cate", "boo_code");
		map.put("input", Integer.toString(booCode));
		model.addAttribute("paymentList", paymentDao.paymentList(map));		
	}
	
	// 결제 등록 처리
	public void paymentAddPro(Payment payment) {
		if(payment.getpMemo() == "") {
			payment.setpMemo(null);			
		}
		Login result = (Login)session.getAttribute("loginfor");
		payment.seteId(result.geteId());
		paymentDao.paymentAdd(payment);
	}
	
	// 결제 목록
	public void paymentList(Model model, int currentPage, String cate, String input) {
		Map<String, String> map;
		if(cate != "") { 
			map = new HashMap<String, String>();
			map.put("cate", cate);
			map.put("input", input);
		}else {
			map = null;
		}
		map = commonService.paging(model, currentPage, 10, paymentDao.paymentCount(map), map);
		model.addAttribute("paymentList", paymentDao.paymentList(map));
	}
	
	// 결제 취소
	public void paymentCancel(int pCode) {
		paymentDao.paymentCancel(pCode);
	}
	
}
