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
public class Inventory_List extends HttpServlet
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
				
				String query="select * from product_inventory";
				
				ResultSet rs= st.executeQuery(query);
			
				ArrayList<String> id=new ArrayList<String>();
				ArrayList<String> p_name=new ArrayList<String>();
				ArrayList<String> c_name=new ArrayList<String>();
				ArrayList<String> m_name=new ArrayList<String>();
				ArrayList<String> qty=new ArrayList<String>();
				ArrayList<String> price=new ArrayList<String>();
				ArrayList<String> specs=new ArrayList<String>();
				
				while(rs.next())
				{
					id.add(rs.getString(1));
					p_name.add(rs.getString(2));
					c_name.add(rs.getString(3));
					m_name.add(rs.getString(4));
					qty.add(rs.getString(6));
					price.add(rs.getString(7));
					specs.add(rs.getString(8));
				};
								
				request.setAttribute("id", id);
				request.setAttribute("p_name", p_name);
				request.setAttribute("c_name", c_name);
				request.setAttribute("m_name", m_name);
				request.setAttribute("qty", qty);
				request.setAttribute("price", price);
				request.setAttribute("specs", specs);
				HttpSession session=request.getSession();
				String check=(String)session.getAttribute("check");
				if(check!=null)
				{
					session.removeAttribute("check");
					request.getRequestDispatcher("Check_Materials.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("Inventory_List.jsp").forward(request, response);
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