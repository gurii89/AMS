package com.cafe24.guribyn;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CommonService {
	
	// 목록 페이징 (current 페이지 번호, pagePer 페이지당 표시할 데이터수, count DB에 있는 데이터 수)
	public Map<String, Integer> listPaging(Model model, int currentPage, int pagePerRow, int count) {		
		int lastPage = count / pagePerRow;
		if((count % pagePerRow) != 0) {
        	lastPage += 1;
        }
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("lastPage", lastPage);
        
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("start", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        return map;
	}
	
	// 검색 목록 페이징 (목록 페이징 매개변수 + map 검색조건과 검색어가 담겨서 옴)
	public Map<String, String> searchPaging(Model model, int currentPage, int pagePerRow, int count, Map<String, String> map) {
		int lastPage = count / pagePerRow;
		if((count % pagePerRow) != 0) {
        	lastPage += 1;
        }
		model.addAttribute("cate", map.get("cate"));
		model.addAttribute("input", map.get("input"));
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("lastPage", lastPage);
        map.put("start", Integer.toString((currentPage-1)*pagePerRow));
        map.put("pagePerRow", Integer.toString(pagePerRow));        
		return map;
	}
	
}
