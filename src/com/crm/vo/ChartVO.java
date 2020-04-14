package com.crm.vo;

import java.util.Random;

public class ChartVO {

	private String jan;
	private String feb;
	private String mar;
	private String apr;
	private String may;
	private String jun;
	private String jul;
	private String aug;
	private String sep;
	private String oct;
	private String nov;
	private String dec;
	private String year;

	public ChartVO() {}
	
	public ChartVO(String year) {
		this.jan = String.valueOf(new Random().nextInt(100));
		this.feb = String.valueOf(new Random().nextInt(100));
		this.mar = String.valueOf(new Random().nextInt(100));
		this.apr = String.valueOf(new Random().nextInt(100));
		this.may = String.valueOf(new Random().nextInt(100));
		this.jun = String.valueOf(new Random().nextInt(100));
		this.jul = String.valueOf(new Random().nextInt(100));
		this.aug = String.valueOf(new Random().nextInt(100));
		this.sep = String.valueOf(new Random().nextInt(100));
		this.oct = String.valueOf(new Random().nextInt(100));
		this.nov = String.valueOf(new Random().nextInt(100));
		this.dec = String.valueOf(new Random().nextInt(100));
		this.year = year;
	}

	public String getJan() {
		return jan;
	}

	public void setJan(String jan) {
		this.jan = jan;
	}

	public String getFeb() {
		return feb;
	}

	public void setFeb(String feb) {
		this.feb = feb;
	}

	public String getMar() {
		return mar;
	}

	public void setMar(String mar) {
		this.mar = mar;
	}

	public String getApr() {
		return apr;
	}

	public void setApr(String apr) {
		this.apr = apr;
	}

	public String getMay() {
		return may;
	}

	public void setMay(String may) {
		this.may = may;
	}

	public String getJun() {
		return jun;
	}

	public void setJun(String jun) {
		this.jun = jun;
	}

	public String getJul() {
		return jul;
	}

	public void setJul(String jul) {
		this.jul = jul;
	}

	public String getAug() {
		return aug;
	}

	public void setAug(String aug) {
		this.aug = aug;
	}

	public String getSep() {
		return sep;
	}

	public void setSep(String sep) {
		this.sep = sep;
	}

	public String getOct() {
		return oct;
	}

	public void setOct(String oct) {
		this.oct = oct;
	}

	public String getNov() {
		return nov;
	}

	public void setNov(String nov) {
		this.nov = nov;
	}

	public String getDec() {
		return dec;
	}

	public void setDec(String dec) {
		this.dec = dec;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "ChartVO [jan=" + jan + ", feb=" + feb + ", mar=" + mar + ", apr=" + apr + ", may="
				+ may + ", jun=" + jun + ", jul=" + jul + ", aug=" + aug + ", sep=" + sep + ", oct=" + oct + ", nov="
				+ nov + ", dec=" + dec + ", year=" + year + "]";
	}

}
