

package com.eighth.util;

public class Page {
	//��ʼλ��
	int start=0;
	//ÿҳ�ĸ���
	int count=10;
	//���һҳ��λ��
	int last=0;
	//������
	int total=0;
	//��ǰ����ҳ
	int currentPage=1;
	//��ҳ��
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
		//�������һҳ��ʼ��λ��
		if(0==total%count) {
			last=total-count;
		}else {
			last=total-total%count;
		}
		
	}

	
	
}
