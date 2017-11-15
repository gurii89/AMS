package com.cafe24.guribyn.extra;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ExtraService {

	@Autowired
	ExtraDao extraDao;
	
	@Autowired
	HttpSession session;
	
	// 서비스 등록
	public void ExtraAddPro(Extra extra) {
		extraDao.extraAdd(extra);
	}
	
	// 서비스 목록
	public void ExtraList(Model model) {
		model.addAttribute("extraList", extraDao.extraList());
		session.setAttribute("top", "extra");
	}
	
}
