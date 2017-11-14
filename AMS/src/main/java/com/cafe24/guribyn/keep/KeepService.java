package com.cafe24.guribyn.keep;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.keep.Keep;;

@Service
public class KeepService {
	
	@Autowired
	KeepDao keepDao;

	@Autowired
	HttpSession HS;
	
	// 보관품 등록 처리
	public int KeepAdd(Keep keep) {
		System.out.println("보관품 등록 처리KeepService");
		return keepDao.KeepAdd(keep);
	}
	// 보관품 전체 리스트
	public List<Keep> keepList() {
		System.out.println("보관품 전체리스트 KeepService");
		return keepDao.keepList();
	}
	// 보관품 위치 설정
	/*public String KeepSession() {
		HS.setAttribute("top", "keep");
		return "";*/
	
	// 보관품 수정폼
	public Keep keepModForm(String kCode) {
		System.out.println("KeepService 보관품 수정폼");
		return keepDao.keepOneSelect(kCode);
	}
	
	// 보관품 수정처리
	public int KeepMod(Keep keep) {
		System.out.println("KeepService 보관품 수정 처리");
		System.out.println(keep);
		return keepDao.KeepMod(keep);
	}
}
