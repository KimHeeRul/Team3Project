package DTO;

import java.util.ArrayList;

public class NoticePaging {
	private int nowPage = 1; // 현재 페이지
	private final int displayNotice = 10; // 한 페이지에 보여질 공지 수
//	private final int displayNotice = 1; // 한 페이지에 보여질 공지 수
	private final int displayPage = 10; // 페이지에 보여질 페이지 수
//	private final int displayPage = 2; // 페이지에 보여질 페이지 수
	private int totalNotice; // 전체 공지 수 카운트
	private int totalPage; // 전체 페이지 카운트
	private int startPage; // 페이지 옵션 출력 시작 값(ex : 1)
	private int endPage; // 페이지 옵션 출력 끝 값(ex : 10)
	private boolean first; // first 버튼이 보일지/안 보일지
	private boolean end; // end 버튼이 보일지/안 보일지
	private boolean prev; // prev 버튼이 보일지/안 보일지
	private boolean next; // next 버튼이 보일지/안 보일지
	private String sql;

	public void setTotalCnt(int totalCnt) {
		System.out.println("set에 nowPage :" + this.nowPage);
		this.totalNotice = totalCnt;
		this.totalPage = this.totalNotice / displayNotice;
		
		if(this.totalNotice % displayNotice > 0) {
			this.totalPage++;
		}
		
		// 현재 페이지가 마지막 페이지 초과일때 보정
		if(this.nowPage > this.totalPage) {
			this.nowPage = this.totalPage;
		}
		
		// 정수 부분 사라지는 것
		// ((int) (page / 10)) * 10 + 1 와 동일
		this.startPage = ((this.nowPage - 1) / this.displayPage) * this.displayPage + 1;
		this.endPage = this.startPage + this.displayPage - 1;
		
		
		// 출력되는 페이지옵션이 마지막 페이지 이상일때 보정
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}

		if (this.startPage > 1) {
			System.out.print("<a href=\"?page=1\">처음</a>");
			this.first = true;
		}

		if (this.nowPage > 1) {
			System.out.println("<a href=\"?page=" + (this.nowPage - 1) + "\">이전</a>");
			this.prev = true;
		}

//		for (int i = this.startPage; i <= this.endPage; i++) {
//			if (i == this.nowPage) {
//				System.out.print(" <b>" + i + "</b>");
//			} else {
//				System.out.print(" " + i + " ");
//			}
//		}

		if (this.nowPage < this.totalPage) {
			System.out.println("<a href=\"?page=" + (this.nowPage + 1) + "\">다음</a>");
			this.next = true;
		}

		if (this.endPage < this.totalPage) {
			System.out.print("<a href=\"?page=" + totalPage + "\">끝</a>");
			this.end = true;
		}
		
//		String sql내림차순역순정렬 = "SELECT * FROM notice ORDER BY createdate DESC limit  ((nowPage - 1) * displayPage  이부분은 실제 값을 넣어야함 수식 안됨), displayNotice";
		this.sql = String.format("SELECT * FROM notice ORDER BY n_no DESC limit  %d, %d", (this.nowPage - 1) * this.displayNotice,this.displayNotice);
		System.out.println("현재페이지 : " + this.nowPage);
		System.out.println("쿼리 확인 : " + (this.nowPage - 1) * this.displayNotice+"/"+this.displayNotice);
	}
	
	public void setNowPage(int page) {
		this.nowPage = page;
	}

	public int getNowPage() {
		return nowPage;
	}

	public int getDisplayNotice() {
		return displayNotice;
	}

	public int getDisplayPage() {
		return displayPage;
	}

	public int getTotalNotice() {
		return totalNotice;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isFirst() {
		return first;
	}

	public boolean isEnd() {
		return end;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public String getSql() {
		return sql;
	}
	
}
