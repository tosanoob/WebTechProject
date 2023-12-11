package Model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.management.Query;

import Model.bean.*;

public class DAO {
	
	public static ResultSet exc(String query) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btlcnw", "root", "");
			Statement stm = conn.createStatement();
			ResultSet r = stm.executeQuery(query);
			return r;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public static int excUpdate(String query) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btlcnw", "root", "");
			Statement stm = conn.createStatement();
			int r = stm.executeUpdate(query);
			return r;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	//------------USER section-----------------
	
	public boolean checkLogin(String username, String password) {
		ResultSet r = exc(String.format("select * from user where username = '%s' and password = '%s'",username,password));
		try {
			if (r.next()) {
				return true;
			}
			r.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<User> getAllUser() { //get all
		List<User> result = new ArrayList<>();
		ResultSet r = exc("select * from user");
		try {
			while (r.next()) {
				result.add(new User(r.getString("username"),"********")); //ko view mat khau
			}
			r.close();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<User> getAllUser(String search) { //tim kiem
		List<User> result = new ArrayList<>();
		ResultSet r = exc("select * from user where username LIKE '%"+search+"%'");
		try {
			while (r.next()) {
				result.add(new User(r.getString("username"),"********")); //ko view mat khau
			}
			r.close();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<String> getAllUsername() { //de tao tai khoan
		List<String> result = new ArrayList<>();
		ResultSet r = exc("select * from user");
		try {
			while (r.next()) {
				result.add(new String(r.getString("username"))); //ko view mat khau
			}
			r.close();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public User getUserByUsername(String username) {
		ResultSet r = exc(String.format("select * from user where username = '%s'",username));
		try {
			User result;
			if (r.next()) {
				result = new User(r.getString("username"),"********"); //ko view mat khau
				return result;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean addUser (User a) {
		String query = String.format("insert into user (username, password) values ('%s','%s');", a.getUsername(), a.getPassword());
		int r = excUpdate(query);
		return (r>0); 
	}
	
	public boolean updateUser (User a) {
		String query = String.format("update user set password = '%s' where username = '%s'", a.getPassword(), a.getUsername());
		int r = excUpdate(query);
		return (r>0);
	}
	
	public boolean deleteUser (String username) {
		String query = String.format("delete from user where username = '%s'", username);
		int r = excUpdate(query);
		return (r>0);
	}
	//------------Article section--------------
	
	public List<Article> getAllArticle() {
		List<Article> result = new ArrayList<>();
		ResultSet r = exc("select * from article");
		try {
			while (r.next()) {
				result.add(new Article(
						r.getString("id"),
						r.getDate("date"),
						r.getString("title"),
						r.getString("content"),
						r.getString("writer"))); 
			}
			r.close();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Article> searchArticleByTitle(String search) {
		List<Article> result = new ArrayList<>();
		ResultSet r = exc("select * from article where title LIKE '%"+search+"%'");
		try {
			while (r.next()) {
				result.add(new Article(
						r.getString("id"),
						r.getDate("date"),
						r.getString("title"),
						r.getString("content"),
						r.getString("writer"))); 
			}
			r.close();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public Article getArticleById(String id) {
		ResultSet r = exc(String.format("select * from article where id = '%s'",id));
		try {
			Article result;
			if (r.next()) {
				result = new Article(
						r.getString("id"),
						r.getDate("date"),
						r.getString("title"),
						r.getString("content"),
						r.getString("writer")); //ko view mat khau
				return result;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean addArticle(Article a) {
		String query = String.format("insert into article (id,date,title,content,writer) values"
				+ "('%s','%s','%s','%s','%s')",a.getId(),a.getDateString(),a.getTitle(),a.getContent(),a.getWriter());
		int r = excUpdate(query);
		System.err.println("Add article attempt finished on DAO");
		return (r>0);
	}
	
	public boolean updateArticle (Article a) {
		String query = String.format("update article set date = '%s', title = '%s', content = '%s', writer = '%s' where id = '%s'",
				a.getDateString(),a.getTitle(),a.getContent(),a.getWriter(),a.getId());
		int r = excUpdate(query);
		return (r>0);
	}
	
	public boolean deleteArticle(String id) {
		String query = String.format("delete from article where id = '%s'", id);
		int r = excUpdate(query);
		return (r>0);
	}
	
	public String getNewId() {
		String query = "select id from article";
		ResultSet r = exc(query);
		String maxId = "00000";
		int value = 0;
		try {
			while (r.next()) {
				int idInt = Integer.parseInt(r.getString(1));
				if (idInt > value) {
					value = idInt;
				}
			}
			value++;
			maxId = String.format("%05d",value);
			return maxId;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
