package com.cafe24.guribyn.keep;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cafe24.guribyn.keep.Keep;

@Repository
public class KeepDao {
	@Autowired
	SqlSessionTemplate sst;
	
	
	private final String NS="com.cafe24.guribyn.keep.KeepMapper";
		
	// 보관품 수
		public int keepCount() {
			return sst.selectOne(NS+"keepCount");
		}
	
	//보관품 등록처리
	public void keepAddPro(Keep keep) {
		System.out.println("보관품 등록처리 KeepDao");
		sst.insert(NS+".keepAdd", keep);
	}
	//보관품 전체 리스트
	public List<Keep> keepList(){
		System.out.println("보관품 전체 리스트 KeepDao");
		return sst.selectList(NS+".keepList");
	}
	//보관품 수정폼 select
	public Keep keepOneSelect(String kCode) {
		System.out.println("KeepDao 보관품 수정폼");
		return sst.selectOne(NS+".KeepOneSelect", kCode);
	}
	
	//보관품 수정처리
	public int KeepMod(Keep keep) {
		System.out.println("KeepDao 보관품 수정처리");
		return sst.update(NS+".KeepMod", keep );
	}
}
