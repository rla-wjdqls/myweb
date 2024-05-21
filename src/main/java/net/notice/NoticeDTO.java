package net.notice;

public class NoticeDTO {
	
   //멤버변수
   private int noticeno; 
   private String subject;
   private String content;
   private String regdt;

	
   //기본생성자
   public NoticeDTO() {}


   //getter, setter 함수
	public int getNoticeno() {
		return noticeno;
	}
	
	
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
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
	
	
	public String getRegdt() {
		return regdt;
	}
	
	
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	
	
	//에러 잡을 용도로 사용
	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", subject=" + subject + ", content=" + content + ", regdt=" + regdt
				+ "]";
	}
   

 }//class end
