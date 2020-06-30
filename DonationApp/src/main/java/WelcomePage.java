import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet; 
import java.io.IOException;
import javax.servlet.ServletException; 

@WebServlet (urlPatterns = "/welcome.do")
public class WelcomePage extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request,  response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("choose"); 
		if (value.equals("org")) {
			response.sendRedirect("/orgmain.do"); 
		}
		else {
			response.sendRedirect("/donorsearch.do");
		}
	}
}
