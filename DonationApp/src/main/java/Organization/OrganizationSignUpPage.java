package Organization;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (urlPatterns = "/orgsignup.do")
public class OrganizationSignUpPage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	OrgFile list = new OrgFile();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/OrgSignup.jsp").forward(request,  response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String name = request.getParameter("name");
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String address = request.getParameter("address");
			String phone = request.getParameter("phone"); 
			String email = request.getParameter("email"); 
			String[] items = request.getParameterValues("items");
			list.addOrg(name, username, password, address, phone, email, items); 
			request.getRequestDispatcher("/WEB-INF/views/OrgHomePage.jsp").forward(request, response);
	}

}
