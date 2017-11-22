package com.cafe24.guribyn.extra;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.login.Login;
import com.google.gson.Gson;

@Service
public class ExtraService {

	@Autowired
	ExtraDao extraDao;
	
	@Autowired
	HttpSession session;
	
	// 서비스 등록
	public void extraAddPro(Extra extra) {
		Login result = (Login)session.getAttribute("loginfor");
		extra.seteId(result.geteId());
		extraDao.extraAdd(extra);
	}
	
	// 서비스 목록
	public void extraList(Model model) {
		model.addAttribute("extraList", extraDao.extraList());
		session.setAttribute("top", "extra");
	}
	
	// 서비스 분류에 맞는 서비스 목록
	public String extraName(String cateCode) {
		Gson gson = new Gson();
		return gson.toJson(extraDao.extraName(cateCode));
	}
	
}
