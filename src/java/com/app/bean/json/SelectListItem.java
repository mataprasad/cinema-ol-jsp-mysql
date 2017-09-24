package com.app.bean.json;

public class SelectListItem {

	private String text;
	private String value;
	private boolean selected;

	public SelectListItem() {
		text = "";
		value = "";
		selected = false;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}
}
