package members;
/*SQL> create table lol_member (
  2  email varchar2(100),
  3  username varchar2(20),
  4  nickname varchar2(20),
  5  pass varchar2(20)
  6  );*/
public class MemberDTO {
	private String email;
	private String username;
	private String nickname;
	private String pass;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
}
