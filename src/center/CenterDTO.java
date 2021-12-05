package center;
/*
SQL> create table lol_center(
  2  nickname varchar2(20),
  3  title varchar2(100),
  4  inner varchar2(500),
  5  writeTime varchar2(20),
  6  fileName varchar2(256),
  7  email varchar2(100),
  8  );

Table created.

SQL> create sequence lol_center_seq increment by 1 start with 1;

Sequence created.
 */
public class CenterDTO {
	private int num;
	private String nickname;
	private String subject;
	private String content;
	private String writeTime;
	private String fileName;
	private int hit;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
