package com.eighth.util;

public class RankingCondition {
	private Integer type;
	
	private Integer count;
	
	public RankingCondition() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RankingCondition(Integer type, Integer count) {
		super();
		this.type = type;
		this.count = count;
	}
	
	public Integer getType() {
		return type;
	}
	
	public void setType(Integer type) {
		this.type = type;
	}
	
	public Integer getCount() {
		return count;
	}
	
	public void setCount(Integer count) {
		this.count = count;
	}
	
}
