package pack;

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

import pack.DatabaseConnecter;

@WebServlet("/PackageServlet") 
public class PackageServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 		
	
		String Pname = request.getParameter("Pname");
		String NoOfper = request.getParameter("NoOfper");
		String Pdate = request.getParameter("Pdate");
		String NoOfDay = request.getParameter("NoOfDay");
		String Vdetails = request.getParameter("Vdetails");


		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into pack1 (Pid,Pname,NoOfper,Pdate,NoOfDay,Vdetails) values(?,?,?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			     st.setInt(1, 0);
			 	 st.setString(2, Pname);			    
			     st.setString(3, NoOfper);			    
			     st.setString(4, Pdate);			    
			     st.setString(5, NoOfDay);
			     st.setString(6, Vdetails);			    	    


			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Package and Costing Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/PackageView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
		    	e.printStackTrace(); 
		        }
			}	
	} 
	



