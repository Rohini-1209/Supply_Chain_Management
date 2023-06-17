package serve;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Profile extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("user1");
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			try 
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="select * from user_details where phone='"+user+"' ";
				
				ResultSet rs= st.executeQuery(query);
						
				String name="";
				String phone="";
				String email="";
				String category="";
				String pass="";
				String address="";
				String city="";
				String zip="";
				while(rs.next())
				{
					name=rs.getString(2);
					phone=rs.getString(3);
					email=rs.getString(4);
					category=rs.getString(5);
					pass=rs.getString(6);
					address=rs.getString(7);
					city=rs.getString(8);
					zip=rs.getString(9);
				};
				request.setAttribute("name", name);
				request.setAttribute("phone", phone);
				request.setAttribute("email", email);
				request.setAttribute("category", category);
				request.setAttribute("pass", pass);
				request.setAttribute("address", address);
				request.setAttribute("city", city);
				request.setAttribute("zip", zip);
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
			} catch (SQLException e1) 
			{
				e1.printStackTrace();
			}
		} catch (ClassNotFoundException e1) 
		{
			e1.printStackTrace();
		}
	}
}