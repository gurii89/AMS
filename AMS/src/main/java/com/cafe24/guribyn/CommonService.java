package com.cafe24.guribyn;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.login.Login;

@Service
public class CommonService {
	
	@Autowired
	HttpSession session;
	
	//home 세션 설정
	public String HomeSesseion() {
		session.setAttribute("top", "home");
		Login result = (Login)session.getAttribute("loginfor");
		return result.geteDepartment();
	}
	
	// 검색 목록 페이징 (목록 페이징 매개변수 + map 검색조건과 검색어가 담겨서 옴)
	public Map<String, String> paging(Model model, int currentPage, int pagePerRow, int count, Map<String, String> map) {
        if(map != null) {
        	model.addAttribute("cate", map.get("cate"));
    		model.addAttribute("input", map.get("input"));
        }else {
        	map = new HashMap<String, String>();
        }		
		int lastPage = count / pagePerRow;
		if((count % pagePerRow) != 0) {
        	lastPage += 1;
        }
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("lastPage", lastPage);
        map.put("start", Integer.toString((currentPage-1)*pagePerRow));
        map.put("pagePerRow", Integer.toString(pagePerRow));
		return map;
	}
	
}
