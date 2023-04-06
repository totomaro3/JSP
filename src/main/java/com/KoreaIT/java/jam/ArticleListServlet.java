package com.KoreaIT.java.jam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.KoreaIT.java.jam.util.DBUtil;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");

		// DB 연결
		String url = "jdbc:mysql://127.0.0.1:3306/JSPAM?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
		String user = "root";
		String password = "";
		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("예외 : 클래스가 없습니다");
			System.out.println("프로그램을 종료합니다");
			return;
		}

		try {
			conn = DriverManager.getConnection(url, user, password);

			response.getWriter().append("Success!!!");

			DBUtil dbUtil = new DBUtil(request, response);

			String sql = "SELECT * FROM article;";

			List<Map<String, Object>> articleRows = dbUtil.selectRows(conn, sql);
			
			
			List<Article> articles = new ArrayList<>();
			
			for (Map<String, Object> articleRow : articleRows) {
				articles.add(new Article(articleRow));
			}
					
			response.getWriter().append("번호   /   작성자   /   제목   /   조회\n");
			for (Article article : articles) {
				response.getWriter().append(String.format("<div>%4d   /     %s   /   %s   /   %d</div><br>", article.id, article.title, article.body));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

class Article {
	int id;
	String regDate;
	String title;
	String body;
	
	Article(int id,String regDate,String title,String body) {
		this.id = id;
		this.regDate = regDate;
		this.title = title;
		this.body = body;
	}

	public Article(Map<String, Object> articleRow) {
		// TODO Auto-generated constructor stub
	}
}
