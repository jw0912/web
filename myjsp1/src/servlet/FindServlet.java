package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

public class FindServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//1. 요청 파라미터 조회
		String id = req.getParameter("id");
		//2. 비지니스 로직 처리 - Model 호출
		Member member = new Member(id,"1111","이회원","lee@naver.com",300000); //조회결과
		//3. 응답 -view 호출(JSP)
		req.setAttribute("result", member);
		req.getRequestDispatcher("/actiontag/response2.jsp").forward(req, resp);
		
	}
}
