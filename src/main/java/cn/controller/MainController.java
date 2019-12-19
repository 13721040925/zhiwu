package cn.controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.html")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class<?> cl = Class.forName("cn.controller.MainController");
			String path = request.getServletPath();// /path.html
			path = path.substring(1, path.lastIndexOf("."));
			System.out.println(path + ">>>>>>>>>>>>>>>>>>>>>>");
			Method mt = cl.getDeclaredMethod(path, HttpServletRequest.class, HttpServletResponse.class);
			mt.invoke(this, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("Error", "路径不存在！");
		}
	}

	// part
	public void part(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/part.jsp").forward(request, response);
	}

}
