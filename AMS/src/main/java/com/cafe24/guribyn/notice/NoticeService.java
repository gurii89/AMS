package com.cafe24.guribyn.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	HttpSession session;
	
	//공지사항 등록
	public int NoticeAdd(Notice notice) {
		System.out.println("---공지사항 등록처리---------from service");
		return noticeDao.NoticeAdd(notice);
	}
	//공지사항 세션 설정
	public String NoticeSesseion() {
		session.setAttribute("top", "notice");
		return "";
	}
	//공지사항 전체 리스트
	public List<Notice> noticeList() {
		System.out.println("---공지사항 전체리스트---------from service");
		return noticeDao.noticeList();
	}
	
	//공지사항 수정폼
	public Notice noticeUpdateForm(String nCode) {
		System.out.println("---공지사항 수정폼---------from service");
		return noticeDao.noticeOneSelect(nCode);
	}
	
	//공지사항 수정처리
	public int NoticeUpdate(Notice notice) {
		System.out.println("---공지사항 수정처리---------from service");
		System.out.println(notice);
		return noticeDao.NoticeUpdate(notice);
	}
}
