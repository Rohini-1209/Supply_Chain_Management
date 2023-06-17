package serve;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Product_edit extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		String edit="edit";
		String delete="delete";
		
		String id=request.getParameter("idno");
		String product_id=request.getParameter("p_id");
		String product_name=request.getParameter("p_name");
		String operation=request.getParameter("operation");
		
		if(operation.equals(edit))
		{
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try
				{
					Connection con=DriverManager.getConnection(url,uName,uPass);
					
					Statement st=con.createStatement();
					
					ResultSet rs= st.executeQuery("select * from products");
					int count=0;
					HttpSession session=request.getSession();
					while(rs.next())
					{
						String sno=rs.getString(1);
						if(id.equals(sno))
						{
							st.executeUpdate("update products set product_id='"+ product_id+"',product_name='"+product_name+"' ");
							count=1;
							break;
						}
					};
					if(count>0)
					{
						session.setAttribute("product_edit", "Product Details Updated Successfully");
						response.sendRedirect("Product_List.jsp");
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
		if(operation.equals(delete))
		{
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try
				{
					Connection con=DriverManager.getConnection(url,uName,uPass);
					
					Statement st=con.createStatement();
					
					ResultSet rs= st.executeQuery("select * from products");
					int count=0;
					HttpSession session=request.getSession();
					while(rs.next())
					{
						String sno=rs.getString(1);
						if(id.equals(sno))
						{
							st.executeUpdate("delete from products where id='"+id+"' ");
							count=1;
							break;
						}
					};
					if(count>0)
					{
						session.setAttribute("product_edit", "Product Details Deleted Successfully");
						response.sendRedirect("Product_List.jsp");
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
}