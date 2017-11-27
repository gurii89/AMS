package com.cafe24.guribyn.payment;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDao {
	
	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.payment.PaymentMapper.";

	// 결제 등록 처리
	public void paymentAdd(Payment payment) {
		SST.insert(NS+"paymentAdd", payment);
	}
	
	// 예약 건 결제금액 총합
	public int bookingPayment(int booCode) {
		return SST.selectOne(NS+"bookingPayment", booCode);
	}
	
	// 결제 목록
	public List<Payment> paymentList(Map<String, String> map) {
		return SST.selectList(NS+"paymentList", map);
	}
	
	// 결제 개수
	public int paymentCount(Map<String, String> map) {
		return SST.selectOne(NS+"paymentCount", map);
	}
	
	// 결제 취소
	public void paymentCancel(int pCode) {
		SST.update(NS+"paymentCancel", pCode);
	}
	
}
