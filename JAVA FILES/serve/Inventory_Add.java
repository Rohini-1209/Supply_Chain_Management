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
public class Inventory_Add extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";
		String uName="root";
		String uPass="";
		
		String p_name=request.getParameter("p_name");
		String c_name=request.getParameter("c_name");
		String m_name=request.getParameter("m_name");
		String phone=request.getParameter("phone");
		String qty=request.getParameter("qty");
		String price=request.getParameter("price");
		String description=request.getParameter("description");
		String product=request.getParameter("product");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			try
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="insert into product_inventory(product_name, company_name, manufacturer_name, phone, quantity, price, specifications)values('"+p_name+"','"+c_name+"','"+m_name+"','"+phone+"','"+qty+"','"+price+"', '"+description+"')";
				
				st.executeUpdate(query);
				st.executeUpdate("insert into supplier_details(phone,company_name)values('"+phone+"','"+c_name+"')");
				
				String message="Inventory Added to the database";
				HttpSession session=request.getSession();
				if(product!=null)
				{
					session.setAttribute("inventory", message);
					request.getRequestDispatcher("S_Inventory.jsp").forward(request, response);
				}
				else
				{
					session.setAttribute("inventory", message);
					request.getRequestDispatcher("Inventory.jsp").forward(request, response);
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