package interceptors;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberLoginInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle (HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			// 회원 로그인 여부 체크
			if(request.getSession().getAttribute("memberInfo") == null) { // 미로그인
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인이 필요한 페이지입니다.');");
				out.print("location.href='/user';");
				out.print("<script>");
				out.print("");
				out.flush();
				return false;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return true;
	}
}
