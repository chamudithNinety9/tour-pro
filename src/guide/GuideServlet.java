package guide;

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

import guide.DatabaseConnecter;

@WebServlet("/GuideServlet") 
public class GuideServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 		
	
		String Gname = request.getParameter("Gname");
		String Gaddress = request.getParameter("Gaddress");
		String Gnic = request.getParameter("Gnic");
		String Gemail = request.getParameter("Gemail");
		String Gpno = request.getParameter("Gpno");


		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into guide1 (Gid,Gname,Gaddress,Gnic,Gemail,Gpno) values(?,?,?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			     st.setInt(1, 0);
			 	 st.setString(2, Gname);			    
			     st.setString(3, Gaddress);			    
			     st.setString(4, Gnic);			    
			     st.setString(5, Gemail);
			     st.setString(6, Gpno);			    	    


			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Guide Register Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/GuideView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
		    	e.printStackTrace(); 
		        }
			}	
	} 
	



