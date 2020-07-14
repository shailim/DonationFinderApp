package Organization;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (urlPatterns = "/orghome.do")
public class OrganizationHomePage extends  HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrgFile x = new OrgFile(); 
		String id = request.getParameter("id"); 
		String name = request.getParameter("name"); 
		String address = request.getParameter("address"); 
		String phone = request.getParameter("phone"); 
		String email = request.getParameter("email"); 
		String[] items = request.getParameterValues("items"); 
		x.updateOrg(id, name, address, phone, email, items);
	}
}
