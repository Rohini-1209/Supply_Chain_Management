package serve;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class User_Login extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		String Phone=request.getParameter("phone");
		String Password=request.getParameter("pass");
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			try 
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="select * from users";
				
				ResultSet rs= st.executeQuery(query);
				
				int count=0;
				String category="";
				String message="";
				while(rs.next())
				{
					String phone=rs.getString(3);
					String Category=rs.getString(5);
					String Pass=rs.getString(6);
					
					if(Phone.equals(phone))
					{
						if(Password.equals(Pass))
						{
							count=1;
							category=Category;
						}
						else
						{
							count=0;
						}
					}
				};
				if(count>0)
				{
					HttpSession session=request.getSession();
					switch(category)
					{
						case "Admin":
							session.setAttribute("user", "Admin Login Successful");
							session.setAttribute("user1", Phone);
							response.sendRedirect("Admin_Home.jsp");
							break;
						
						case "Client":
							session.setAttribute("user", "Client Login Successful");
							session.setAttribute("user1", Phone);
							response.sendRedirect("Client_Home.jsp");
							break;
							
						case "Dealer":
							session.setAttribute("user", "Supplier Login Successful");
							session.setAttribute("user1", Phone);
							response.sendRedirect("Supplier_Home.jsp");
							break;
					}
				}
				else
				{
					message="Invalid Details";
					request.setAttribute("login",message);
					request.getRequestDispatcher("Login.jsp").forward(request, response);
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