package com.cafe24.guribyn.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private final String NS="com.cafe24.guribyn.notice.NoticeMapper";
	
	//공지사항 등록처리
	public int NoticeAdd(Notice notice) {
		System.out.println("---공지사항 등록처리---------from dao");
		return sqlSessionTemplate.insert(NS+".insertNotice", notice);
	}
	//공지사항 전체리스트
	public List<Notice> noticeList(){
		System.out.println("---공지사항 전체리스트---------from dao");
		return sqlSessionTemplate.selectList(NS+".NoticeAllSelect");
	}
	//공지사항 수정폼 select
	public Notice noticeOneSelect(String nCode) {
		System.out.println("---공지사항 수정폼---------from dao");
		System.out.println(nCode);
		return sqlSessionTemplate.selectOne(NS+".NoticeOneSelect", nCode);
	}
	//공지사항 수정처리
	public int NoticeUpdate(Notice notice) {
		System.out.println("---공지사항 수정처리---------from dao");
		return sqlSessionTemplate.update(NS+".UpdateNotice", notice);
	}
}
