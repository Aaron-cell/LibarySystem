

package com.eighth.util;

public class Page {
	//开始位置
	int start=0;
	//每页的个数
	int count=10;
	//最后一页的位置
	int last=0;
	//总数量
	int total=0;
	//当前所在页
	int currentPage=1;
	//总页数
	int lastPage=0;
	public Page() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Page(int start, int count, int last) {
		super();
		this.start = start;
		this.count = count;
		this.last = last;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getLast() {
		return last;
	}
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	public void setLast(int last) {
		this.last = last;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public void caculateLast(int total) {
		//计算最后一页开始的位置
		if(0==total%count) {
			last=total-count;
		}else {
			last=total-total%count;
		}
		
	}

	
	
}
