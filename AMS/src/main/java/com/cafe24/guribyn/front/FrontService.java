package com.cafe24.guribyn.front;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.room.Room;
import com.cafe24.guribyn.room.RoomDao;
import com.cafe24.guribyn.room.RoomService;
import com.google.gson.Gson;

@Service
public class FrontService {
	@Autowired
	HttpSession session;
	
	@Autowired
	private RoomService roomService;

	//프로트 세션 설정
	public String FrontSesseion() {
		session.setAttribute("top", "front");
		return "";
	}
	//전체 객실 불러오기
	public Model allRoom(Model model){
		System.out.println("---전체 객실 불러오기---------from service");
		List<Room> list = roomService.roomToFront();
		//System.out.println("호수 가져오기"+list);
		int allroomcode = list.size(); //총 객실 수 
		int toproom = 0; //최고층 변수
		int bottomroom = 0; //최저층 변수
		
		int [] roc = new int[list.size()]; //최저최고층 뽑는 int 리스트
		int [] rocv = new int[list.size()]; //온전한 호수 int 리스트
		
		//호수랑, 층수 넣을 타입
		ArrayList<FrontRoom> frontRoom = new ArrayList<FrontRoom>();
		
		//1.최고,최저층 뽑기
		for(int i=0; i<list.size(); i++) {
			FrontRoom fr = new FrontRoom();
			int a = (list.get(i).getRoomCode()).length();
			rocv[i] =  Integer.parseInt(list.get(i).getRoomCode());
			roc[i] = Integer.parseInt((list.get(i).getRoomCode()).substring(0, a-2));
			fr.setRoomCodeMarkF(roc[i]);
			fr.setRoomCodeF(rocv[i]);
			
			frontRoom.add(fr);
		}
		
			System.out.println("roc = "+Arrays.toString(roc));
			Arrays.sort(roc); //정렬
			bottomroom = roc[0];
			toproom = roc[roc.length-1];
			System.out.println("최저층="+bottomroom);
			System.out.println("최고층="+toproom);
			System.out.println("총객실수="+allroomcode);
			System.out.println(frontRoom);
			
			model.addAttribute("frontRoom", frontRoom);
			model.addAttribute("allroomcode", allroomcode);
			model.addAttribute("bottomroom", bottomroom);
			model.addAttribute("toproom", toproom);
			
			//중복제거 층수 구하기
			List floor = new ArrayList();
			
			for(int k=0; k<roc.length-1; k++) {
				if(roc[k] != roc[k+1]) {
					floor.add(roc[k]);
				}else if(k == roc.length-2) {
					if(roc[k] == roc[k+1]) {
						floor.add(roc[k]);
					}
				}
			}
			
			Collections.reverse(floor);
			System.out.println("floor = "+floor);
			model.addAttribute("floor", floor);
			
			//룸타입 드롭다운을 위한가져오기
			
			
			model.addAttribute("frontdroprt", roomService.roomTypeList());
			
			return model;
	}

	//한 객실 정보 불러오기 ******
	public String roomDetailFromFront(String FrCode) {
		System.out.println("---한 객실 정보 불러오기---------from service");
		Gson gson = new Gson();
		return gson.toJson(roomService.roomDetailFromFront(FrCode));
	}

}
