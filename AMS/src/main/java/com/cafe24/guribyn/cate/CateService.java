package com.cafe24.guribyn.cate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.CommonService;
import com.cafe24.guribyn.login.Login;
import com.google.gson.Gson;

@Service
public class CateService {
	@Autowired
	CateDao cateDao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CommonService commonService;
	
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
	
	// 카테고리 등록 처리
	public void cateAddPro(Cate cate){
		Login result = (Login)session.getAttribute("loginfor");
		cate.seteId(result.geteId());
		cateDao.cateAddPro(cate);
	}
	
	// 전체 카테고리 select(+페이징)
	public void cateList(Model model, int currentPage){
		Map<String, Integer> map = commonService.listPaging(model, currentPage, 2, cateDao.cateCount());
        session.setAttribute("top", "cate");
        model.addAttribute("page", "cateList");
		model.addAttribute("cateList", cateDao.cateList(map));
	}
	
	// 전체 카테고리 select(폼 옵션용, 페이징x)
	public void cateOption(Model model){
		model.addAttribute("cateList", cateDao.cateOption());
	}
	
	// 카테고리 검색(+페이징)
	public void cateSearch(Model model, String cate, String input, int currentPage){
		Map<String, String> map = new HashMap<String, String>();
		map.put("cate", cate);
		map.put("input", input);		
		map = commonService.searchPaging(model, currentPage, 2, cateDao.cateSearchCount(map), map);
        model.addAttribute("cateList", cateDao.cateSearch(map));
        model.addAttribute("page", "cateSearch");
	}
	
	// 카테고리 검색(폼 옵션용, 페이징x) / cate 컬럼명, input 검색어 
	public void cateOptionSearch(Model model, String cate, String input) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cate", cate);
		map.put("input", input);
		model.addAttribute("cateList", cateDao.cateSearch(map));
	}
	
	// RoomOption에서 이용 시작-----------------------------------------------------
	public List<Cate> cateSmallOnly(){
		return cateDao.cateSmallOnly();
	}
	public String cateSmallOnlyName(String small){
		List<Cate> list = cateDao.cateSmallOnlyName(small);
		System.out.println("카테서비스까지옴"+list);
		Gson RommOptiongson = new Gson();
		return RommOptiongson.toJson(list);
	}
	// RoomOption에서 이용 끝 ------------------------------------------------------
	
}
