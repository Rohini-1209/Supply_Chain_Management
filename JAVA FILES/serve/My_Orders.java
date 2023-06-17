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
public class My_Orders extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("user1");
				
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			try 
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				String query="select * from requirements where supplier='"+user+"'";
				
				ResultSet rs= st.executeQuery(query);
			
				ArrayList<String> id=new ArrayList<String>();
				ArrayList<String> client=new ArrayList<String>();
				ArrayList<String> p_name=new ArrayList<String>();
				ArrayList<String> c_name=new ArrayList<String>();
				ArrayList<String> m_name=new ArrayList<String>();
				ArrayList<String> req_qty=new ArrayList<String>();
				ArrayList<String> value1=new ArrayList<String>();
				ArrayList<String> status=new ArrayList<String>();
				ArrayList<String> action=new ArrayList<String>();
				
				while(rs.next())
				{             
					id.add(rs.getString(1));
					client.add(rs.getString(2));
					p_name.add(rs.getString(3));
					c_name.add(rs.getString(4));
					m_name.add(rs.getString(6));
					req_qty.add(rs.getString(7));
					value1.add(rs.getString(8));
					status.add(rs.getString(9));
					action.add(rs.getString(10));
				};
								
				request.setAttribute("id", id);
				request.setAttribute("client", client);
				request.setAttribute("p_name", p_name);
				request.setAttribute("c_name", c_name);
				request.setAttribute("m_name", m_name);
				request.setAttribute("req_qty", req_qty);
				request.setAttribute("value", value1);
				request.setAttribute("status", status);
				request.setAttribute("action", action);
				request.getRequestDispatcher("My_Orders.jsp").forward(request, response);
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
