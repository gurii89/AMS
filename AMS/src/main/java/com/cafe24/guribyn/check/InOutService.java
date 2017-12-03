package com.cafe24.guribyn.check;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.CommonService;

@Service
public class InOutService {

	@Autowired
	InOutDao inOutDao;
	
	@Autowired
	CommonService commonService;
	
	// 입퇴실 목록
	public void inOutList(Model model, int currentPage, String cate, String input) {
		Map<String, String> map;
		if(cate != "") { 
			map = new HashMap<String, String>();
			map.put("cate", cate);
			map.put("input", input);
		}else {
			map = null;
		}
		map = commonService.paging(model, currentPage, 10, inOutDao.inOutCount(map), map);
		model.addAttribute("inOutList", inOutDao.inOutList(map));
	}
	
}
