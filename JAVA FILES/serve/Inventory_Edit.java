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
public class Inventory_Edit extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		String edit="edit";
		String delete="delete";
		
		String id=request.getParameter("idno");
		String pname=request.getParameter("pname");
		String cname=request.getParameter("cname");
		String mname=request.getParameter("mname");
		String qty=request.getParameter("qty");
		String price=request.getParameter("price");
		String specs=request.getParameter("specs");
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
					
					ResultSet rs= st.executeQuery("select * from product_inventory");
					int count=0;
					HttpSession session=request.getSession();
					while(rs.next())
					{
						String sno=rs.getString(1);
						if(id.equals(sno))
						{
							st.executeUpdate("update product_inventory set product_name='"+ pname+"',company_name='"+cname+"',manufacturer_name='"+mname+"',quantity='"+qty+"',price='"+price+"',specifications='"+specs+"' where id='"+id+"' ");
							count=1;
							break;
						}
					};
					if(count>0)
					{
						session.setAttribute("inventory", "Inventory Details Updated Successfully");
						response.sendRedirect("Inventory_List.jsp");
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
					
					ResultSet rs= st.executeQuery("select * from product_inventory");
					int count=0;
					HttpSession session=request.getSession();
					while(rs.next())
					{
						String sno=rs.getString(1);
						if(id.equals(sno))
						{
							st.executeUpdate("delete from product_inventory where id='"+id+"' ");
							count=1;
							break;
						}
					};
					if(count>0)
					{
						session.setAttribute("inventory", "Inventory Details Deleted Successfully");
						response.sendRedirect("Inventory_List.jsp");
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