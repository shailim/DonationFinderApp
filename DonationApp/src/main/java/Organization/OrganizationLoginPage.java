package Organization;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (urlPatterns = "/orglogin.do")
public class OrganizationLoginPage extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/OrgLogin.jsp").forward(request,  response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrgFile newObj = new OrgFile(); 
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		if (newObj.verifyOrg(username, password)) {
			String id = newObj.getId(); 
			ArrayList<String> details = newObj.getCurrentOrgDetails(); 
			ArrayList<String> items = newObj.getCurrentOrgItems(); 
			request.setAttribute("id", id); 
			request.setAttribute("details", details);
			request.setAttribute("items", items);
			request.getRequestDispatcher("/WEB-INF/views/currentOrgPage.jsp").forward(request,  response);
		} else {
			request.setAttribute("errorMessage", "Invalid Credentials! Please try again.");
			request.getRequestDispatcher("/WEB-INF/views/orglogin.jsp").forward(request,  response); 
		}
	}
}
