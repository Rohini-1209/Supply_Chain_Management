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
public class User_List extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			try 
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="select * from users";
				
				ResultSet rs= st.executeQuery(query);
			
				ArrayList<String> id=new ArrayList<String>();
				ArrayList<String> fullname=new ArrayList<String>();
				ArrayList<String> phone=new ArrayList<String>();
				ArrayList<String> email=new ArrayList<String>();
				ArrayList<String> category=new ArrayList<String>();
				ArrayList<String> password=new ArrayList<String>();
				
				while(rs.next())
				{
					id.add(rs.getString(1));
					fullname.add(rs.getString(2));
					phone.add(rs.getString(3));
					email.add(rs.getString(4));
					category.add(rs.getString(5));
					password.add(rs.getString(6));
				};
								
				request.setAttribute("id", id);
				request.setAttribute("fullname", fullname);
				request.setAttribute("phone", phone);
				request.setAttribute("email", email);
				request.setAttribute("category", category);
				request.setAttribute("password", password);
				request.getRequestDispatcher("User_List.jsp").forward(request, response);
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