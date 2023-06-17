package serve;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class User_Register extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";
		String uName="root";
		String uPass="";
		
		String name=request.getParameter("fname");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String category=request.getParameter("user");
		String pass=request.getParameter("pass");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			try
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="insert into users(name,phone,email,category,password)values('"+name+"','"+phone+"','"+email+"','"+category+"','"+pass+"')";
				
				st.executeUpdate(query);
				st.executeUpdate("insert into user_details (name,phone,email,category,password,address,city,zipcode)values('"+name+"','"+phone+"','"+email+"','"+category+"','"+pass+"','"+null+"','"+null+"','"+null+"')");
				
				String message="User Registered";
				HttpSession session=request.getSession();
				session.setAttribute("register", message);
				request.getRequestDispatcher("Register.jsp").forward(request, response);
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
}