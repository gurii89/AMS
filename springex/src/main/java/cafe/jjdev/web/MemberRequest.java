package cafe.jjdev.web;

public class MemberRequest {
	private String MemberId;
	private String MemberPw;
	private String MemberName;
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public String getMemberPw() {
		return MemberPw;
	}
	public void setMemberPw(String memberPw) {
		MemberPw = memberPw;
	}
	public String getMemberName() {
		return MemberName;
	}
	public void setMemberName(String memberName) {
		MemberName = memberName;
	}
	@Override
	public String toString() {
		return "MemberRequest [MemberId=" + MemberId + ", MemberPw=" + MemberPw + ", MemberName=" + MemberName + "]";
	}
	
}
