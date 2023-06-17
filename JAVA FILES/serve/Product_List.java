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

@SuppressWarnings("serial")
public class Product_List extends HttpServlet
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
				
				String query="select * from products";
				
				ResultSet rs= st.executeQuery(query);
			
				ArrayList<String> id=new ArrayList<String>();
				ArrayList<String> product_id=new ArrayList<String>();
				ArrayList<String> product_name=new ArrayList<String>();
				
				while(rs.next())
				{
					id.add(rs.getString(1));
					product_id.add(rs.getString(2));
					product_name.add(rs.getString(3));
				};
								
				request.setAttribute("id", id);
				request.setAttribute("product_id", product_id);
				request.setAttribute("product_name", product_name);
				request.getRequestDispatcher("Product_List.jsp").forward(request, response);
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