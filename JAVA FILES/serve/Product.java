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
public class Product extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
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
				
				String query="select * from product_inventory";
				
				ResultSet rs= st.executeQuery(query);
			
				ArrayList<String> p_name=new ArrayList<String>();
				int count=0;
				while(rs.next())
				{
					String name=rs.getString(2);
					for(int i=0;i<p_name.size();i++)
					{
						String list=p_name.get(i);
						if(list.equals(name))
						{
							count++;
						}
					}
					if(count==0)
					{
						p_name.add(rs.getString(2));
					}
				};
				HttpSession session=request.getSession();
				session.setAttribute("p_name", p_name);
				request.getRequestDispatcher("Client_Order.jsp").forward(request, response);
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