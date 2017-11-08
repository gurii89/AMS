package com.cafe24.guribyn.cate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.login.EmployeeTest;
import com.google.gson.Gson;

@Service
public class CateService {
	@Autowired
	CateDao cateDao;
	
	@Autowired
	HttpSession session;
	
	// 대분류 출력
	public List<Cate> cateLarge(){
		return cateDao.cateLarge();
	}
	
	// 대분류에 연동된 소분류 출력용, list 값을 json으로 변경해 전송
	public String cateSmall(String large){
		List<Cate> list = cateDao.cateSmall(large);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	// 동일한 소분류 하위에 카테고리명 중복검사, 중복없을시 ok 중복시 no
	public String cateNameCheck(String name, String small){
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("small", small);
		if(cateDao.cateNameCheck(map) == null) {
			return "ok";
		}else{
			return "no";
		}		
	}
	
	// 카테고리 등록
	public void cateAdd(Cate cate){
		EmployeeTest result = (EmployeeTest)session.getAttribute("loginemployee");
		cate.seteId(result.geteId());
		cateDao.cateAdd(cate);
	}	
}
