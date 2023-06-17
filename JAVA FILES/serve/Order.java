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
public class Order extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		String product=request.getParameter("pname");
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			try 
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="select * from product_inventory";
				
				ResultSet rs= st.executeQuery(query);
				ArrayList<String> pr_name=new ArrayList<String>();	
				ArrayList<String> c_name=new ArrayList<String>();
				ArrayList<String> m_name=new ArrayList<String>();
				ArrayList<String> qty=new ArrayList<String>();
				ArrayList<String> price=new ArrayList<String>();
				ArrayList<String> specs=new ArrayList<String>();
				
				while(rs.next())
				{
					String pname=rs.getString(2);
					if(pname.equals(product))
					{
						pr_name.add(pname);
						c_name.add(rs.getString(3));
						m_name.add(rs.getString(4));
						qty.add(rs.getString(6));
						price.add(rs.getString(7));
						specs.add(rs.getString(8));
					}
				};
				
				request.setAttribute("product_name", pr_name);
				request.setAttribute("c_name", c_name);
				request.setAttribute("m_name", m_name);
				request.setAttribute("qty", qty);
				request.setAttribute("price", price);
				request.setAttribute("specs", specs);
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