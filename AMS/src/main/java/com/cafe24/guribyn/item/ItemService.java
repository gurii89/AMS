package com.cafe24.guribyn.item;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ItemService {

	@Autowired
	ItemDao itemDao;

	@Autowired
	HttpSession session;

	// 물품 등록 처리
	public void itemAddPro(Item item) {
		itemDao.itemAddPro(item);
	}

	// 물품 목록
	public void itemList(Model model) {
		model.addAttribute("itemList", itemDao.itemList());
		session.setAttribute("top", "item");
	}
}
