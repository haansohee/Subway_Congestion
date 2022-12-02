package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.MemberDAO;

public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/member/login.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String userID = req.getParameter("userID");
		String userPassword = req.getParameter("userPassword");
		
		MemberDAO mDAO = MemberDAO.getInstance();
		int loginResult = mDAO.login(userID, userPassword);
		
		if (loginResult == 1) {
			req.setAttribute("loginResult", loginResult);
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", userID);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/index.jsp");
			System.out.println(userID);
			rd.forward(req, resp);
		} else {
			req.setAttribute("loginResult", loginResult);
			RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/member/login.jsp");
			rd.forward(req, resp);
		}
	}

}
