package com.crm.vo;

public class CalendarVO {

	private int _id;
	private String title;
	private String start;
	private String end;
	private String backgroundColor;
	private String description;
	private boolean allDay;
	private String c_User_Id;

	public int get_id() {
		return _id;
	}

	public void set_id(int _id) {
		this._id = _id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public String getC_User_Id() {
		return c_User_Id;
	}

	public void setC_User_Id(String c_User_Id) {
		this.c_User_Id = c_User_Id;
	}

	@Override
	public String toString() {
		return "CalendarVO [_id=" + _id + ", title=" + title + ", start=" + start + ", end=" + end
				+ ", backgroundColor=" + backgroundColor + ", description=" + description + ", allDay=" + allDay
				+ ", c_User_Id=" + c_User_Id + "]";
	}

}
