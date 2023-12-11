package Model.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
	String id;
	Date date;
	String title;
	String content;
	String writer;
	
	public Article(String id, Date date, String title, String content, String writer) {
		this.id = id;
		this.date = date;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	
	public String getId() {
		return id;
	}
	
	public Date getDate() {
		return date;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getContent() {
		return content;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setId(String a) {
		this.id = a;
	}
	
	public void setDate(Date a) {
		this.date = a;
	}
	
	public void setTitle(String a) {
		this.title = a;
	}
	
	public void setContent(String a) {
		this.content = a;
	}
	
	public void setWriter(String a) {
		this.writer = a;
	}
	
	public String getDateString() {
		String formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
		return formattedDate;
	}
}
