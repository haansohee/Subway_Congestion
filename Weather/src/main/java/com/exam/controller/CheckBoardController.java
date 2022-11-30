package com.exam.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.service.*;

public class CheckBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	private void process (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getParameter("cmd") == null || req.getParameter("cmd").equals("")) {
			return;
		}
		
		String cmd = req.getParameter("cmd");
		System.out.println(cmd);
		
		Action action = router(cmd, req, resp);
		if (action != null) {
			action.execute(req, resp);
		}
		
	}
	int result = -1;
	
	private Action router(String cmd, HttpServletRequest req, HttpServletResponse resp) {
		if (cmd.equals("checkAll")) {
			return new checkAll();
		} 
		return null;
	}

}
