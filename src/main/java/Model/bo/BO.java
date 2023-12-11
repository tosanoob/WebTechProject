package Model.bo;

import Model.dao.DAO;
import Model.bean.*;
import java.util.*;

public class BO {
	DAO dao;
	
	public BO() {
		this.dao = new DAO();
	}
	
//	----------------------------USER SECTION-------------------------
	
//	Login
//	Input: username, password
	public boolean checkLogin(String username, String password) {
		return dao.checkLogin(username, password);
	}
	
//	View all user
	public List<User> getAllUser() {
		return dao.getAllUser();
	}
	
//	Search user by username
//	Input: search key
	public List<User> getAllUser(String search) {
		return dao.getAllUser(search);
	}
	
//	Get all username, for add method "get"
	public List<String> getAllUsername() {
		return dao.getAllUsername();
	}
	
//	Get a user with username
//	may not necessary?
//	for update method "get"
//	Input: username
	public User getUserByUsername(String username) {
		return dao.getUserByUsername(username);
	}
	
//	Add a new user
//	Input: User(username, password)
	public boolean addUser(User a) {
		return dao.addUser(a);
	}
	
//	Update a user's password
//	Input: User(username, password) 
	public boolean updateUser(User a) {
		return dao.updateUser(a);
	}
	
//	Delete a user by username
//	Input: username
	public boolean deleteUser(String username) {
		return dao.deleteUser(username);
	}
	
//	----------------------ARTICLE SECTION----------------------------
	
//	Get all article
	public List<Article> getAllArticle() {
		return dao.getAllArticle();
	}
	
//	Get an article by its Id, for detail view
//	Input: id
	public Article getArticleById(String id) {
		return dao.getArticleById(id);
	}
	
//	Add an article, Id and date will be auto-generated
//	Input: title, content, writer
	public boolean addArticle(String title, String content, String writer) {
		Date date = new Date();
		long timeInMs = date.getTime();
		long offsetInMs = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
		date.setTime(timeInMs + offsetInMs); // Calculate date in GMT+7
		String id = dao.getNewId();
		System.err.println("Add article attempt");
		return dao.addArticle(new Article(id,date,title,content,writer));
	}
	
//	Update an article, automatically update the date
//	Input: Article(id, date, title, content, writer)
	public boolean updateArticle(Article a) {
		Date date = new Date();
		long timeInMs = date.getTime();
		long offsetInMs = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
		date.setTime(timeInMs + offsetInMs); // Calculate date in GMT+7
		
		a.setDate(date);
		return dao.updateArticle(a);
	}
	
//	Delete an article by id
//	Input: id
	public boolean deleteArticle(String id) {
		return dao.deleteArticle(id);
	}
}
