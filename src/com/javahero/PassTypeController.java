package com.javahero;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javahero.model.Login;
import com.javahero.service.LoginService;
import com.javahero.util.Encrypter;

public class PassTypeController extends HttpServlet {

	private static final long serialVersionUID = -7989391532807985435L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = ((HttpServletRequest) request).getSession(false);
		String me = session.getId();
		LoginService loginService = new LoginService();
		try {
			// String encUserId = Encrypter.convertToActual(new
			// StringBuffer(request.getParameter("RSAUSERID"))).toString();
			String encUserId = new StringBuffer(request.getParameter("RSAUSERID")).toString();
			Login login = new Login();

			login.setEncUserId(encUserId);
			loginService.generateLoginDetails(login);

			PrintWriter out = response.getWriter();
			StringBuffer sb = new StringBuffer("<RUP>");
			String ab = login.getSalt();

			sb.append(" <RUPV ");
			sb.append(" name=\'").append(ab).append("\' ");
			sb.append(" seqpwd=\'").append(login.getSeqPassword()).append("\' ");
			sb.append("/>");
			sb.append("</RUP>");
			out.write(sb.toString());
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		System.out.println("LoginHandler.getPasswordType(HttpServletRequest request, HttpServletResponse response");
	}

}
