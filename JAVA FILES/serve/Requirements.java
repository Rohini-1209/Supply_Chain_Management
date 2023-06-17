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
public class Requirements extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";
		String uName="root";
		String uPass="";
		
		String id=request.getParameter("id");
		String phone=request.getParameter("phone");
		String p_name=request.getParameter("p_name");
		String c_name=request.getParameter("cname");
		String m_name=request.getParameter("mname");
		String qty=request.getParameter("req_qty");
		String price=request.getParameter("o_price");
		String status=request.getParameter("status");
		String supplier=request.getParameter("supplier");
		
		if(status==null&&qty!=null)
		{
			status="Pending";
			supplier="Not Accepted";
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try
				{
					Connection con=DriverManager.getConnection(url,uName,uPass);
					
					Statement st=con.createStatement();
					
					String cn="select * from supplier_details where company_name='"+c_name+"'";
					ResultSet rs=st.executeQuery(cn);
					String phone1="";
					while(rs.next())
					{
							phone1=rs.getString(2);
					};
					
					String query="insert into requirements(client_number,product_name, company_name,supplier, manufacturer_name, required_quantity, order_value, status, supplier_action)values('"+phone+"','"+p_name+"','"+c_name+"','"+phone1+"','"+m_name+"','"+qty+"','"+price+"', '"+status+"','"+supplier+"')";
					
					st.executeUpdate(query);
					
					HttpSession session=request.getSession();
					session.setAttribute("order", "Order sent for Comfirmation");
					request.getRequestDispatcher("Client_Order.jsp").forward(request, response);
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
		if(id!=null&&status!=null)
		{
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try
				{
					Connection con=DriverManager.getConnection(url,uName,uPass);
					
					Statement st=con.createStatement();
					status="confirmed";
					ResultSet rs= st.executeQuery("select * from requirements");
					int count=0;
					HttpSession session=request.getSession();
					while(rs.next())
					{
						st.executeUpdate("update requirements set status='"+status+"' where id='"+id+"' ");
						count=1;
						break;
					};
					if(count>0)
					{
						session.setAttribute("ordered", "Status Updated Successfully");
						response.sendRedirect("Check_Requirement.jsp");
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
		if(id!=null&&supplier!=null)
		{
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try
				{
					Connection con=DriverManager.getConnection(url,uName,uPass);
					
					Statement st=con.createStatement();
					supplier="Accepted";
					ResultSet rs= st.executeQuery("select * from requirements");
					int count=0;
					HttpSession session=request.getSession();
					while(rs.next())
					{
							st.executeUpdate("update requirements set supplier_action='"+supplier+"'  where id='"+id+"' ");
							count=1;
							break;
					};
					if(count>0)
					{
						session.setAttribute("ordered", "Action Took");
						response.sendRedirect("My_Orders.jsp");
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
		if(supplier!=null)
		{
			
		}
	}
}