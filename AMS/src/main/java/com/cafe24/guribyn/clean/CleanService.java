package com.cafe24.guribyn.clean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.room.RoomCondition;
import com.cafe24.guribyn.room.RoomService;

@Service
public class CleanService {
	@Autowired
	HttpSession session;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private CleanDao cleanDao;
	
	//청소 세션 설정
	public String cleanSesseion() {
		session.setAttribute("top", "clean");
		return "";
	}
	//전체 객실 불러오기
	public Model RoomRcCon(Model model) {
		System.out.println("---클린서비스임 전체 객실 코드, 상태 불러오기---------from service");
		return model.addAttribute("cleanrtcon", roomService.RoomRcCon());
	}
	//청소시작
	public int cleanStart(String roomCode, String eId) {
		System.out.println("---청소 시작---------from service");
		Clean clean = new Clean();
		clean.seteId(eId);
		clean.setRoomCode(roomCode);
	
		return cleanDao.cleanStart(clean);
	}
	//청소시작 시간 불러오기
	public Clean cleanStartTime(String roomCode, String eId) {
		System.out.println("---청소 시작 시간---------from service");
		Clean clean = new Clean();
		clean.seteId(eId);
		clean.setRoomCode(roomCode);
		return cleanDao.cleanStartTime(clean);
	}
	//청소중인 리스트
	public List<Clean> cleanList() {
		System.out.println("---청소 중인 리스트---------from service");
		System.out.println("룸코드만 뽑기");	
		return cleanDao.cleanList();
	}
	//청소완료 등록
	public int cleanEnd(String roomCode, String eId) {
		System.out.println("---청소 완료---------from service");
		RoomCondition roomCondition = new RoomCondition();
		roomCondition.setRoomCode(roomCode);
		roomCondition.seteId(eId);
		roomCondition.setRoomConCondition("청소완료");
		roomService.RoomConditionAdd(roomCondition);
		return cleanDao.cleanEnd(roomCode);
	}
	//청소완료 리스트
	public List<Clean> cleanEndList(){
		System.out.println("---청소완료 리스트    ---------from service");
		return cleanDao.cleanEndList();
	}
	//청소완료 페이징
	public Map<String, String> cleanAllCount(Model model, int currentPage, Map<String, String> map) {
		System.out.println("---청소완료 페이징    ---------from service");
		// totalCount : clean table 전체 row 수 
		int totalCount = cleanDao.cleanAllCount();
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
		int startPage = currentPage/PAGEPERPAGE;
			if(startPage <= 0) {
				startPage = 1;
			}else {
				int na2 = PAGEPERPAGE%currentPage;
				startPage = (startPage - na2)*PAGEPERPAGE +1; 
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
		
		model.addAttribute("cleanListR", cleanDao.cleanPageing(map));
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);

		return  map;
	}
	
}
