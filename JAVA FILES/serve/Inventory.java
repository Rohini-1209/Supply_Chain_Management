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
public class Inventory extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("supplier1");
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			try 
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="select * from products";
				
				ResultSet rs= st.executeQuery(query);
			
				ArrayList<String> product_id=new ArrayList<String>();
				ArrayList<String> product_name=new ArrayList<String>();
				
				while(rs.next())
				{
					product_id.add(rs.getString(2));
					product_name.add(rs.getString(3));
				};
								
				
				request.setAttribute("product_id", product_id);
				request.setAttribute("product_name", product_name);
				if(user==null)
				{
					request.getRequestDispatcher("Inventory.jsp").forward(request, response);
				}
				else
				{
					session.removeAttribute("supplier");
					request.getRequestDispatcher("S_Inventory.jsp").forward(request, response);
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