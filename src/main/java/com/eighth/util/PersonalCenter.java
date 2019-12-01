package com.eighth.util;

import java.util.Date;

public class PersonalCenter {
	
	private int rid;
	
	private String name;
	
	private String author;
	
	private String publish;
	
	private Double price;
	
	private int status;
	
    private Date borrowtime;

    private Date returntime;

	public PersonalCenter(int rid, String name, String author, String publish, Double price, int status,
			Date borrowtime, Date returntime) {
		super();
		this.rid = rid;
		this.name = name;
		this.author = author;
		this.publish = publish;
		this.price = price;
		this.status = status;
		this.borrowtime = borrowtime;
		this.returntime = returntime;
	}
	
	

	public int getRid() {
		return rid;
	}



	public void setRid(int rid) {
		this.rid = rid;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getBorrowtime() {
		return borrowtime;
	}

	public void setBorrowtime(Date borrowtime) {
		this.borrowtime = borrowtime;
	}

	public Date getReturntime() {
		return returntime;
	}

	public void setReturntime(Date returntime) {
		this.returntime = returntime;
	}
    
    
	
}
