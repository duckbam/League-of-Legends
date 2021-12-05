package center;

public class CenterList {
	private int pageNumber; // 요청 페이지 번호
	private int start; // 반복문 초기 값
	private int scroll; // 페이지 당 게시글 수
	private int totalPage; // 총 페이지 수
	private int totalRecord; // 총 게시글 수
	
	public CenterList() {
		setScroll();
	}
	private void setScroll() {
		this.scroll = 3;
	}
	
	public void setPageNumber(String pn) {
		if(pn == "" || pn == null)
			this.pageNumber = 1;
		else
			this.pageNumber = Integer.parseInt(pn);
		setStart();
	}
	
	private void setStart() {
		this.start = (this.pageNumber - 1) * this.scroll;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		setTotalPage();
	}
	
	private void setTotalPage() {
		if(totalRecord > 0) {
			if(totalRecord % scroll == 0) {
				this.totalPage = this.totalRecord / this.scroll;
			}else {
				this.totalPage = (this.totalRecord / this.scroll) + 1;
			}
		}
		
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public int getStart() {
		return start;
	}
	public int getScroll() {
		return scroll;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	
	

}
