package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = (Member)req.getAttribute("member");
		System.out.println("요청파라미터 :"+member);
		
		//비지니스 로직 - memberService.addMember(member);
		
		//응답
		req.getRequestDispatcher("/actiontag/response3.jsp").forward(req, resp);
		//resp.sendRedirect("/myjsp/actiontag/response3.jsp");
	}
}
