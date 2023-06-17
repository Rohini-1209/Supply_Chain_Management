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
public class User_Delete extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String url="jdbc:mysql://localhost:3306/supply_chain_management";	
		String uName="root";
		String uPass="";
		
		String id=request.getParameter("idno");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			try
			{
				Connection con=DriverManager.getConnection(url,uName,uPass);
				
				Statement st=con.createStatement();
				
				ResultSet rs= st.executeQuery("select * from users");
				int count=0;
				HttpSession session=request.getSession();
				while(rs.next())
				{
					String sno=rs.getString(1);
					if(id.equals(sno))
					{
						st.executeUpdate("delete from users where id='"+id+"' ");
						count=1;
						break;
					}
				};
				if(count>0)
				{
					session.setAttribute("delete", "User Details Deleted Successfully");
					response.sendRedirect("User_List.jsp");
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