package com.cafe24.guribyn.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	//공지사항 등록폼
	@RequestMapping(value="/noticeAdd", method = RequestMethod.GET)
	public String noticeAddForm(Model model) {
		System.out.println("---공지사항 등록 폼---------from controller");
		return "/notice/noticeAdd";
	}
	
	//공지사항 리스트
	@RequestMapping(value="/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model) {
		System.out.println("---공지사항 리스트---------from controller");
		//top session 설정
		noticeService.NoticeSesseion();
		
		model.addAttribute("list", noticeService.noticeList());
		return "/notice/noticeList";
	}
	
	//공지사항 등록처리
	@RequestMapping(value="/noticeAdd", method = RequestMethod.POST)
	public String noticeAddPro(Notice notice) {
		System.out.println("---공지사항 등록 처리---------from controller");
		noticeService.NoticeAdd(notice);
		return "redirect:/noticeList";	
	}
	
	//한 공지사항 수정폼
	@RequestMapping(value="/noticeUpdate", method = RequestMethod.GET)
		public String noticeUpdateForm(Model model, @RequestParam ("nCode") String nCode) {
			System.out.println("---공지사항 수정폼---------from controller");
			model.addAttribute("noticed", noticeService.noticeUpdateForm(nCode));
			return "/notice/noticeUpdate";
		}
	//공지사항 수청처리
	@RequestMapping(value="/noticeUpdate", method = RequestMethod.POST)
		public String noticeUpdatePro(Notice notice) {
		System.out.println("---공지사항 수정 처리---------from controller");
		System.out.println(notice);
		noticeService.NoticeUpdate(notice);
		return "redirect:/noticeList";
	}
}
