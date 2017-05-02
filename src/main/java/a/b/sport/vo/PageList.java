package a.b.sport.vo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import a.b.sport.HomeController;

public class PageList<T> {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private List<T> list; // 한페이지 분량의 데이터 리스트

	// 전체개수
	private int totalCount;
	// 페이지당 개수
	private int pageSize;
	// 페이지 리스트 사이즈
	private int blockSize;
	// 현재 페이지 수
	private int currentPage;
	
	// 전체 페이지 수
	private int totalPage;
	// 시작 글번호
	private int startNo;
	// 끝 글번호
	private int endNo;
	// 시작페이지번호
	private int startPage;
	// 끝페이지번호
	private int endPage;
	
	public PageList(int totalCount, int currentPage, int pageSize, int blockSize) {
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		this.currentPage = currentPage;
		logger.debug("페이지리스트------------------------------------------------");
		if(totalCount>0){
			// 나머지 데이터는 계산한다.
			// 전체페이지수 = (전체개수-1)/페이지당개수 + 1; 
			totalPage = (this.totalCount-1)/this.pageSize + 1;
			if(this.currentPage>totalPage) this.currentPage = 1;
			// 시작번호 = (현재페이지-1)*페이지사이즈 (오라클은 +1을 한다.)
			startNo = (this.currentPage-1) * this.pageSize;
			// 끝번호 = 시작번호 + 페이지 사이즈 - 1
			endNo = startNo + this.pageSize -1;
			if(endNo>=this.totalCount) endNo = this.totalCount-1;
			
			// 시작페이지번호 = (현재페이지-1)/블록사이즈 * 블록사이즈 + 1
			startPage = (this.currentPage-1)/blockSize * this.blockSize + 1;
			endPage = startPage + this.blockSize -1;
			if(endPage>totalPage) endPage = totalPage;
		}
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	@Override
	public String toString() {
		return "PageList [list=" + list + ", totalCount=" + totalCount + ", pageSize=" + pageSize + ", blockSize="
				+ blockSize + ", currentPage=" + currentPage + ", totalPage=" + totalPage + ", startNo=" + startNo
				+ ", endNo=" + endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
}
