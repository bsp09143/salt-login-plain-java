package com.javahero.controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javahero.db.dao.UserDAO;
import com.javahero.model.Login;
import com.javahero.service.LoginService;
import com.javahero.util.Encrypter;

public class LoginController extends HttpServlet {

	private ServletContext context;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		LoginService loginService = new LoginService();
		Login loginDetail = new Login();
		HashMap map = new HashMap();
		HttpSession session = null;

		context = getServletContext();
		if (request.getMethod().equalsIgnoreCase("get")) {
			response.sendRedirect("error.html");
		} else {
			try {
				map = (HashMap) context.getAttribute("loggedUsers");
				String encUserId = request.getParameter("mdiresu");
				String encPassword = request.getParameter("mdwp");
				String encShaPasswordsalt = request.getParameter("shadwp");
				String encShaPassword = encShaPasswordsalt.substring(0, 128);
				String sequenceiD = request.getParameter("id");
				
				loginDetail.setEncUserId(new StringBuffer(encUserId).toString());
				loginService.getDBPassword(loginDetail);
				loginDetail.setSeqPassword(sequenceiD);
				loginService.getSalt(loginDetail);
				String encDbPassword=loginDetail.getDbPassword()+loginDetail.getSalt();
				loginService.deleteSalt(loginDetail);				 
				if(!encShaPasswordsalt.equalsIgnoreCase(encDbPassword)){
					 response.sendRedirect("error.html");
					 
				}else {				
					 response.sendRedirect("success.html");					 
				}
				
				 return;
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// String password = loginService.getDBPassword(un);
		// if(password != null)
		// {
		// if (un.equals("admin") && pw.equals(password))
		// {
		// response.sendRedirect("success.html");
		// return;
		// }
		// else
		// {
		// response.sendRedirect("error.html");
		// return;
		// }
		// }
		// else
		// {
		// System.out.println("User doesn not Exist!!");
		// response.sendRedirect("error.html");
		// return;
		// }
	}
}