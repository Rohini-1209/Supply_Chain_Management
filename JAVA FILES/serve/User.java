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
public class User extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";
		String uName="root";
		String uPass="";
		
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String category=request.getParameter("category");
		String pass=request.getParameter("pass");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String zip=request.getParameter("zip");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			try
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				st.executeUpdate("update user_details set name='"+name+"',email='"+email+"',password='"+pass+"',address='"+ address+"',city='"+city+"',zipcode='"+zip+"' where phone='"+phone+"' ");
				
				String message="User Deatils Updated";
				HttpSession session=request.getSession();
				session.setAttribute("update", message);
				if(category.equals("Admin"))
				{
					request.getRequestDispatcher("Admin_Profile.jsp").forward(request, response);
				}
				if(category.equals("Client"))
				{
					request.getRequestDispatcher("Client_Profile.jsp").forward(request, response);
				}
				if(category.equals("Dealer"))
				{
					request.getRequestDispatcher("Supplier_Profile.jsp").forward(request, response);
				}
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