package place;

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

import place.DatabaseConnecter;

@WebServlet("/PlaceServlet") 
public class PlaceServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 		
	
		String PLname = request.getParameter("PLname");
		String CofPl = request.getParameter("CofPl");
		String EnFee = request.getParameter("EnFee");
		String rules = request.getParameter("rules");
		String PLdesc = request.getParameter("PLdesc");


		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into place1 (PLid,PLname,CofPl,EnFee,rules,PLdesc) values(?,?,?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/tour","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			     st.setInt(1, 0);
			 	 st.setString(2, PLname);			    
			     st.setString(3, CofPl);			    
			     st.setString(4, EnFee);			    
			     st.setString(5, rules);
			     st.setString(6, PLdesc);			    	    


			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Place Register Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/PlaceView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
		    	e.printStackTrace(); 
		        }
			}	
	} 
	



