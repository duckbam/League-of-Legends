package members;

public class MemberCheck {
	
	public boolean emailCheck(String email) {
		String regex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"; // 이메일 정규식
		return email.matches(regex);
	}
	
	public boolean pwEquals(String pass, String passcheck) {
		return pass.equals(passcheck); // 비밀번호와 비밀번호 확인 일치하는지 확인
	}
}
