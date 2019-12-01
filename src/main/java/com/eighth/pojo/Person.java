package com.eighth.pojo;

public class Person {
    private String username;

    private Integer num;

    private Integer maxnum;

    private Integer total;

    private String records;
    
    

    public Person() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Person(String username, Integer num, Integer maxnum, Integer total) {
		super();
		this.username = username;
		this.num = num;
		this.maxnum = maxnum;
		this.total = total;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getMaxnum() {
        return maxnum;
    }

    public void setMaxnum(Integer maxnum) {
        this.maxnum = maxnum;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public String getRecords() {
        return records;
    }

    public void setRecords(String records) {
        this.records = records == null ? null : records.trim();
    }
}