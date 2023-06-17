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
public class Add_Product extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";
		String uName="root";
		String uPass="";
		
		String id=request.getParameter("p_id");
		String name=request.getParameter("p_name");
		String product=request.getParameter("product");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			try
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				String query="insert into products(product_id,product_name)values('"+id+"','"+name+"')";
				
				st.executeUpdate(query);
				
				String message="Product Added";
				HttpSession session=request.getSession();
				if(product!=null)
				{
					session.setAttribute("product", message);
					request.getRequestDispatcher("S_Add_Product.jsp").forward(request, response);
				}
				else
				{
					session.setAttribute("product", message);
					request.getRequestDispatcher("Add_Product.jsp").forward(request, response);
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