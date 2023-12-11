package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.bean.Article;
import Model.bo.BO;

@WebServlet("/")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private BO bo;
	
	public LoginController() {
		super();
		bo = new BO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		switch(action) {
			case "/allbaidang":
				allbaidang(request, response);
				break;
			case "/dangxuat":
				dangxuat(request, response);
				break;
			case "/articledetail":
				articledetail(request, response);
				break;
			default:
				break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub)
		String action = request.getServletPath();
		System.err.println("Attempt " + action);
		switch(action) {
		case "/login":
			login(request,response);
			break;
		case "/editarticle":
			editarticle(request, response);
			break;
		case "/addarticle":
			addarticle(request, response);
			break;
		case "/deletearticle":
			deletearticle(request, response);
			break;
		default:
			break;
		}
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		System.err.println("Login attempt" + username + password);
		if (bo.checkLogin(username, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}
	private void allbaidang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			List<Article> articles = null;
			articles = bo.getAllArticle();
			request.setAttribute("articles", articles);
			System.err.print(articles);
			request.getRequestDispatcher("allbaidang.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void dangxuat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("username");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void articledetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String id = (String) request.getParameter("id");

			Article article = bo.getArticleById(id);
			request.setAttribute("article", article);
//			System.out.print(article.getTitle());
			String mode = (String) request.getParameter("mode");
			if (mode.equals("1")) {
				request.getRequestDispatcher("articledetail.jsp").forward(request, response);
			}
			else if (mode.equals("2")) {
				request.getRequestDispatcher("editarticle.jsp").forward(request, response);
			}
			else if (mode.equals("3")) {
				request.getRequestDispatcher("deletearticle.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void editarticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String id = (String) request.getParameter("id");
			String title = (String) request.getParameter("title");
			String content = (String) request.getParameter("content");
			String dateString = (String) request.getParameter("date");
			String writer = (String) request.getParameter("writer");
//			System.out.print(dateString);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = dateFormat.parse(dateString);
			Article article = new Article(id, date, title, content, writer);
			bo.updateArticle(article);
			List<Article> articles = null;
			articles = bo.getAllArticle();
			request.setAttribute("articles", articles);
			request.getRequestDispatcher("allbaidang.jsp").forward(request, response);
//			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void addarticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			
			String title = (String) request.getParameter("title");
			String content = (String) request.getParameter("content");
			String writer = (String) request.getParameter("writer");
			bo.addArticle(title, content, writer);
			System.err.println("Add article attempt done");
			List<Article> articles = null;
			articles = bo.getAllArticle();
			
			request.setAttribute("articles", articles);
			request.getRequestDispatcher("allbaidang.jsp").forward(request, response);
//			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void deletearticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String id = (String) request.getParameter("id");
			bo.deleteArticle(id);
			List<Article> articles = null;
			articles = bo.getAllArticle();
			request.setAttribute("articles", articles);
			request.getRequestDispatcher("allbaidang.jsp").forward(request, response);
//			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}


