package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.DatabaseConnecter;

@WebServlet("/AdminServlet") 
public class AdminServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 		
	
		String Aname = request.getParameter("Aname");
		String Anic = request.getParameter("Anic");
		String Aaddress = request.getParameter("Aaddress");
		String Aemail = request.getParameter("Aemail");
		String pNo = request.getParameter("pNo");


		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into admin1 (Aid,Aname,Anic,Aaddress,Aemail,pNo) values(?,?,?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
				conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			     st.setInt(1, 0);
			 	 st.setString(2, Aname);			    
			     st.setString(3, Anic);			    
			     st.setString(4, Aaddress);			    
			     st.setString(5, Aemail);
			     st.setString(6, pNo);			    	    


			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Admin Register Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/AdminView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
		    	e.printStackTrace(); 
		        }
			}	
	} 
	



