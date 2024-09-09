package MyPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] jokes = {
	        "Why do Java developers wear glasses? Because they don't C#!",
	        "I told my computer I needed a break, and now it won't stop sending me Kit Kat bars.",
	        "Why don't programmers like nature? It has too many bugs.",
	        "How many programmers does it take to change a light bulb? None, it's a hardware problem.",
	        "What’s a Java developer's favorite animal? A camel—because they love CamelCase.",
	        "What did the Java code say to the C++ code? You have no class.",
	        "Why was the computer cold? Because it left its Windows open.",
	        // Add more jokes here
	    };

    public MyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve parameters
		String str1 = request.getParameter("num1");
		String str2 = request.getParameter("num2");
		String str3 = request.getParameter("bt1");

		// Check for null parameters
		if (str1 == null || str2 == null || str3 == null) {
		    response.getWriter().append("Missing parameters");
		    return;
		}

		// Convert parameters to integers
		int num1, num2;
		try {
		    num1 = Integer.parseInt(str1);
		    num2 = Integer.parseInt(str2);
		} catch (NumberFormatException e) {
		    response.getWriter().append("Invalid number format");
		    return;
		}

		// Perform the operation based on btn1 value
		int ans = 0;
		switch (str3) {
		    case "1":
		        ans = num1 + num2;
		        break;
		    case "2":
		        ans = num1 - num2;
		        break;
		    case "3":
		        ans = num1 * num2;
		        break;
		    case "4":
		        if (num2 != 0) {
		            ans = num1 / num2;
		        } else {
		            response.getWriter().append("Cannot divide by zero");
		            return;
		        }
		        break;
		    default:
		        response.getWriter().append("Invalid operation");
		        return;
		}
		
		int randomIndex = (int) (Math.random() * jokes.length);
	    String randomJoke = jokes[randomIndex];


		// Redirect to the JSP with the result
		response.sendRedirect("NewFile.jsp?ans=" + ans + "&joke=" + randomJoke);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
