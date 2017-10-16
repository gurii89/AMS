package cafe.jjdev.web.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NS="cafe.jjdev.web.service.MemberMapper";
	
	public Member login(Member member) {
		return sqlSessionTemplate.selectOne(NS+"");
	}
	
	public List<Member> selectMemberList() {
		return sqlSessionTemplate.selectList(NS+"selectMember");
	}
	
	public int insertMember(Member member) {
		return sqlSessionTemplate.insert(NS+".insertMember", 
			member);
	}
	
	public Member selectMemberOne(int memberNo) {
		return sqlSessionTemplate.selectOne(
				NS+".selectMemberOne"
				,memberNo);
	}
}
