package com.cafe24.guribyn.front;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.extra.ExtraService;
import com.cafe24.guribyn.room.Room;
import com.cafe24.guribyn.room.RoomCondition;
import com.cafe24.guribyn.room.RoomDao;
import com.cafe24.guribyn.room.RoomService;
import com.google.gson.Gson;

@Service
public class FrontService {
	@Autowired
	HttpSession session;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private ExtraService extraService;

	//프론트 세션 설정
	public String FrontSesseion() {
		session.setAttribute("top", "front");
		return "";
	}
	//전체 객실 불러오기
	public Model allRoom(Model model) throws ParseException{
		System.out.println("---전체 객실 불러오기---------from service");
		List<Room> list = roomService.roomToFront();
		List<RoomCondition> conlist = roomService.RoomRcAllCon();
		System.out.println("호수 가져오기"+list);
		System.out.println("상태 가져오기"+conlist);
		int allroomcode = list.size(); //총 객실 수 
		int toproom = 0; //최고층 변수
		int bottomroom = 0; //최저층 변수
		
		int [] roc = new int[list.size()]; //최저최고층 뽑는 int 리스트
		int [] rocv = new int[list.size()]; //온전한 호수 int 리스트
		String [] rcon = new String[list.size()]; //상태넣을 리스트
		String [] rct = new String[list.size()]; //시간넣을 리스트
		String [] afterto = new String[list.size()]; //12시간 후 시간 넣을 리스트
		//호수랑, 층수 넣을 타입
		ArrayList<FrontRoom> frontRoom = new ArrayList<FrontRoom>();
		
		//1.최고,최저층 뽑기
		for(int i=0; i<list.size(); i++) {
			FrontRoom fr = new FrontRoom();
			String rconf = conlist.get(i).getRoomConCondition();
			
			//시간(기록된시간, 표기할 시간, 12시간 후 시간)
			String rcont = conlist.get(i).getRoomConDate();
			String frontrcont = (conlist.get(i).getRoomConDate()).substring(10, 16);
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date to = transFormat.parse(rcont);
			System.out.println("상태바꾼시점 :"+to);
			Calendar cal = Calendar.getInstance();
			cal.setTime(to);
			cal.add(cal.HOUR, 12);
			Date after12to = cal.getTime();
			String after12 = transFormat.format(after12to);
			System.out.println("12시간후 :"+after12to);
			System.out.println("12시간후 :"+after12);
			
			
			int a = (list.get(i).getRoomCode()).length();
			rocv[i] =  Integer.parseInt(list.get(i).getRoomCode());
			roc[i] = Integer.parseInt((list.get(i).getRoomCode()).substring(0, a-2));
			rcon[i] = rconf;
			rct[i] = frontrcont;
			afterto[i] = after12;
			fr.setRoomConTimeF(rct[i]);
			fr.setRoomConF(rcon[i]);
			fr.setRoomCodeMarkF(roc[i]);
			fr.setRoomCodeF(rocv[i]);
			fr.setRoomTypeCodeNameF(list.get(i).getRoomTypeCode());
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
			System.out.println("12시간후리스트"+afterto);
			
			model.addAttribute("frontRoom", frontRoom);
			model.addAttribute("allroomcode", allroomcode);
			model.addAttribute("bottomroom", bottomroom);
			model.addAttribute("toproom", toproom);
			model.addAttribute("after12to", afterto);
			
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
			
			model.addAttribute("frontdroprt", roomService.roomTypeList());
			
			return model;
	}

	private String transFormat(Date after12to) {
		// TODO Auto-generated method stub
		return null;
	}
	//한 객실 정보 불러오기 ******
	public String roomDetailFromFront(Model model, String FrCode) throws ParseException {
		System.out.println("---한 객실 정보 불러오기---------from service");
		model.addAttribute("FrCode", roomService.roomDetailFromFront(FrCode));
		model.addAttribute("FrRCon", roomService.RoomConditionview(FrCode));
		
		String getConTime = roomService.RoomConTime(FrCode).getRoomConDate();
		SimpleDateFormat transFormatt = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date tto = transFormatt.parse(getConTime);
		System.out.println("한 객실 시간 data로 :"+tto);
		Calendar calt = Calendar.getInstance();
		calt.setTime(tto);
		Date getfortime = calt.getTime();
		String getfortimes = transFormatt.format(getfortime);
		
		model.addAttribute("FrRConTime", getfortimes);
		Gson gson = new Gson();
		return gson.toJson(model);
	}
	
	//서비스 프론트
	public Model extraFront(Model model) {
		//카테고리안의 extra > room의 카테코드가 19.
		model.addAttribute("extralist", extraService.frontExtraName("19"));
		return model;
		
	}
}
