
import Organization.OrgFile;
import Organization.OrgClass;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (urlPatterns = "/donator.do")
public class DonatorPage extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/DonatorPage.jsp").forward(request,  response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrgFile list = new OrgFile();
		String query = request.getParameter("query");
		ArrayList<OrgClass> matches = list.searchOrg(query); 
		if (matches.size() == 0) {
			request.setAttribute("noneMessage", "Sorry! Currently no organizations have listed this item.");
			request.getRequestDispatcher("/WEB-INF/views/donorsearch.jsp").forward(request,  response);
		}
		else {
			request.setAttribute("matches", matches);
			request.getRequestDispatcher("/WEB-INF/views/donorsearch.jsp").forward(request,  response);
		}
	}

}
