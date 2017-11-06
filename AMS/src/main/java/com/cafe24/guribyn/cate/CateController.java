package com.cafe24.guribyn.cate;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CateController {
	
	@Autowired
	private SqlSessionTemplate SST;
	
	@RequestMapping(value = "/cateAdd")
	public String cateAdd() {
		return "cateAdd";
	}
	
	@RequestMapping(value = "/cateAdd", method = RequestMethod.POST)
	public String cateAdd(Cate cate) {
		SST.insert("com.cafe24.guribyn.cate.CateMapper.cateAdd", cate);
		return "cateAdd";
	}
}
