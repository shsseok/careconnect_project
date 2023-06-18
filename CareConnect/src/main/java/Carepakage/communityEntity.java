package Carepakage;

public class communityEntity {
	private int boardId; //구분자
	private String userName;//작성자 이름
	private String boardTitle;//게시판 제목
	private String boardContent;//게시판 내용
	private String boardDate; // 게시 날짜
	private int boardAvailable; // 삭제 유무
	private String email; //구분하기 위해
	private String expertport; // 구분하기 위해서
	private String clienttype;
	public String getClienttype() {
		return clienttype;
	}
	public void setClienttype(String clienttype) {
		this.clienttype = clienttype;
	}
	public String getExpertport() {
		return expertport;
	}
	public void setExpertport(String expertport) {
		this.expertport = expertport;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardrContent) {
		this.boardContent = boardrContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardAvailable() {
		return boardAvailable;
	}
	public void setBoardAvailable(int boardAvailable) {
		this.boardAvailable = boardAvailable;
	}
	
	
	
}
