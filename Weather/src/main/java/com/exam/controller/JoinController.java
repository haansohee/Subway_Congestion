package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.MemberDAO;
import com.exam.DTO.MemberDTO;

public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/member/join.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String userID = req.getParameter("userID");
		String userPassword = req.getParameter("userPassword");
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		String userCity = req.getParameter("userCity");
		
		MemberDAO mDAO = MemberDAO.getInstance();
		MemberDTO mDTO = new MemberDTO();
		
		
		if(mDAO.checkID(userID) != 0) {
			
			mDTO.setUserID(userID);
			mDTO.setUserPassword(userPassword);
			mDTO.setUserName(userName);
			mDTO.setUserEmail(userEmail);
			mDTO.setUserCity(userCity);
		}

		int joinResult = mDAO.join(mDTO);
		System.out.println(joinResult);
		
		if (joinResult == 1) {
			req.setAttribute("joinResult", joinResult);
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", userID);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/index.jsp");
			rd.forward(req, resp);
		} else {
			req.setAttribute("joinResult", 0);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/member/join.jsp");
			rd.forward(req, resp);
		}
	}
	
	
}
