package interceptors;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			//관리자 로그인여부 체크
			if (request.getSession().getAttribute("adminInfo") == null) {  //미로그인
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인 해주세요');");
				out.print("location.href='/manage';");
				out.print("</script>");
				out.print("");
				out.flush();
			}
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return true;
	}

}
