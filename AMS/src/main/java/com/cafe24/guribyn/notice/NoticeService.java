package com.cafe24.guribyn.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		System.out.println(notice);
		return noticeDao.NoticeAdd(notice);
	}
	//공지사항 세션 설정
	public String NoticeSesseion() {
		session.setAttribute("top", "notice");
		return "";
	}
}
