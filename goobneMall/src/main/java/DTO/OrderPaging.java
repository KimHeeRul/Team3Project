package DTO;

import java.util.ArrayList;

public class OrderPaging {
	private int nowPage = 1; // 현재 페이지
	private final int displayOrder = 5; // 한 페이지에 보여질 상품 수
	private final int displayPage = 10; // 페이지에 보여질 페이지 수
	private int totalOrder; // 전체 주문 내역 수 카운트
	private int totalPage; // 전체 페이지 카운트
	private int startPage; // 페이지 옵션 출력 시작 값(ex : 1)
	private int endPage; // 페이지 옵션 출력 끝 값(ex : 10)
	private boolean first; // first 버튼이 보일지/안 보일지
	private boolean end; // end 버튼이 보일지/안 보일지
	private boolean prev; // prev 버튼이 보일지/안 보일지
	private boolean next; // next 버튼이 보일지/안 보일지
	private String sql;

	public void setTotalCnt(int totalCnt, String id) {
		System.out.println("set에 nowPage :" + this.nowPage);
		this.totalOrder = totalCnt;
		this.totalPage = this.totalOrder / this.displayOrder;
		// 전체 주문 수을 디스플레이 주문수로 나눈 몫
		
		if(this.totalOrder % this.displayOrder > 0) {
			// 나머지가 남았을 경우 page ++;
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
		
//		this.sql = String.format("SELECT * FROM pro_order ORDER BY order_no DESC limit  %d, %d", (this.nowPage - 1) * this.displayOrder ,this.displayOrder);

		this.sql = String.format("SELECT * FROM pro_order WHERE id=\"%s\" ORDER BY order_no DESC limit  %d, %d",id, (this.nowPage - 1) * this.displayOrder ,this.displayOrder);
		System.out.println(this.sql);
		
		System.out.println("현재페이지 : " + this.nowPage);
		System.out.println("쿼리 확인 : " + (this.nowPage - 1) * this.displayOrder+"/"+this.displayOrder);
	}
	
	public void setNowPage(int page) {
		this.nowPage = page;
	}

	public int getNowPage() {
		return nowPage;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public int getDisplayPage() {
		return displayPage;
	}

	public int getTotalOrder() {
		return totalOrder;
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
