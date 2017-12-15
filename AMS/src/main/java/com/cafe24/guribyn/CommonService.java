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
 		// totalPage : 전체 페이지 수
 		int totalPage = count/pagePerRow;
 		//현재 화면에서 보여줄 페이지 수, 상수
 		int PAGEPERPAGE = 5;
 		//totalPage가 정수가 아닐 경우, 페이지를 추가
		if(count%pagePerRow == 0){
			System.out.println("추가없음"+totalPage);
		}else if(count%pagePerRow != 0){
			int na = count%pagePerRow;
			totalPage = (count - na)/pagePerRow +1;
			System.out.println("추가 후 :"+totalPage);
		}
 		//한 화면에 보여주는 페이지 개수의 시작
 		int startPage = currentPage/pagePerRow;
		if(startPage <= 1) {
			startPage = 1;
		}else if(currentPage%PAGEPERPAGE == 0){
			startPage = (currentPage - PAGEPERPAGE)/PAGEPERPAGE *PAGEPERPAGE +1;
		}
		else {
			int na2 = currentPage%PAGEPERPAGE;
			System.out.println("나머지 :"+na2);
			startPage = (currentPage - na2)/PAGEPERPAGE *PAGEPERPAGE +1; 
		}
 		//한 화면에 보여주는 페이지 개수의 마지막
 		int lastPage = (startPage + PAGEPERPAGE) -1;
		if(lastPage > totalPage) {
			lastPage = totalPage;
		}
 		
 		model.addAttribute("lastPage", lastPage);
 		model.addAttribute("startPage", startPage);
 		model.addAttribute("currentPage", currentPage);
 		model.addAttribute("totalCount", count);
 		model.addAttribute("pagePerRow", pagePerRow);
 		
        map.put("start", Integer.toString((currentPage-1)*pagePerRow));
        map.put("pagePerRow", Integer.toString(pagePerRow));
		return map;
	}
	
	//검색없고, 하단 페이지있는 페이징 (아마 청소전용...)
	public Map<String, String> cleanAllCount(Model model, int currentPage, int totalCount, Map<String, String> map) {
		System.out.println("---페이징    ---------from service");

		// pagePerRow : 한 페이지에 보여줄 row 수, 상수
		int PAGEPERROW = 3;
		// totalPage : 전체 페이지 수
		int totalPage = totalCount/PAGEPERROW;
		//현재 화면에서 보여줄 페이지 수, 상수
		int PAGEPERPAGE = 5;
		//totalPage가 정수가 아닐 경우, 페이지를 추가
				if(totalCount%PAGEPERROW == 0){
					System.out.println("추가없음"+totalPage);
				}else if(totalCount%PAGEPERROW != 0){
					int na = totalCount%PAGEPERROW;
					totalPage = (totalCount - na)/PAGEPERROW +1;
					System.out.println("추가 후 :"+totalPage);
				}
		//한 화면에 보여주는 페이지 개수의 시작
		int startPage = currentPage/PAGEPERROW;
			if(startPage <= 1) {
				startPage = 1;
			}else if(currentPage%PAGEPERPAGE == 0){
				startPage = (currentPage - PAGEPERPAGE)/PAGEPERPAGE *PAGEPERPAGE +1;
			}
			else {
				int na2 = currentPage%PAGEPERPAGE;
				System.out.println("나머지 :"+na2);
				startPage = (currentPage - na2)/PAGEPERPAGE *PAGEPERPAGE +1; 
			}
		//한 화면에 보여주는 페이지 개수의 마지막
		int lastPage = (startPage + PAGEPERPAGE) -1;
			if(lastPage > totalPage) {
				lastPage = totalPage;
			}
		//페이지당 시작하는 첫 게시글 (쿼리 상 limit 값)
		int start = (currentPage-1) * PAGEPERROW;
		
		/*
		System.out.println("startPage :"+startPage);
		System.out.println("currentPage :"+currentPage);
		System.out.println("lastPage :"+lastPage);
		System.out.println("start :"+start);
		*/
		//dao 변수
		map.put("PAGEPERROW", Integer.toString(PAGEPERROW));
		map.put("start", Integer.toString(start));
		
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("PAGEPERROW", PAGEPERROW);

		return  map;
	}
}
