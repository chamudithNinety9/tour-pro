package com.log;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginForm
 */
@WebServlet("/LoginForm")
public class LoginForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("psw");
		
		if(uname.equals("place")&& pwd.equals("1234")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("PlaceForm.jsp");
		}
		else if(uname.equals("customer")&& pwd.equals("1234")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("CustomerForm.jsp");
		}
		else if(uname.equals("guide")&& pwd.equals("1234")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("GuideForm.jsp");
		}
		else if(uname.equals("admin")&& pwd.equals("1234")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("AdminForm.jsp");
		}
		else if(uname.equals("pack")&& pwd.equals("1234")) {
	
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("PackageForm.jsp");
		}
		
		else {
			response.sendRedirect("Login.jsp");
		}
		
	}

}
