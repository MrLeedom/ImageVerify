package cn.itcast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
	
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 校验验证码
		 * 1. 从session中获取正确的验证码
		 * 2. 从表单中获取用户填写的验证码
		 * 3. 进行比较！
		 * 4. 如果相同，向下运行，否则保存错误信息到request域，转发到login.jsp
		 */
		String sessionCode = (String) request.getSession().getAttribute("session_vcode");
		String paramCode = request.getParameter("verifyCode");
		
		if(!paramCode.equalsIgnoreCase(sessionCode)) {
			request.setAttribute("msg", "验证码错误！");
			request.getRequestDispatcher("/session2/login.jsp").forward(request, response);
			return;
		}
		
		
		/*
		 * 1. 获取表单数据
		 */
		// 处理中文问题
		request.setCharacterEncoding("utf-8");
		// 获取
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		/*
		 * 2. 校验用户名和密码是否正确
		 */
		if(!"itcast".equalsIgnoreCase(username)) {//登录成功
			/*
			 * 附加项：把用户名保存到cookie中，发送给客户端浏览器
			 * 当再次打开login.jsp时，login.jsp中会读取request中的cookie，把它显示到用户名文本框中
			 */
			Cookie cookie = new Cookie("uname", username);//创建Cookie
			cookie.setMaxAge(60*60*24);//设置cookie命长为1天
			response.addCookie(cookie);//保存cookie
			
			/*
			 * 3. 如果成功
			 *   >  保存用户信息到session中
			 *   >  重定向到succ1.jsp
			 */
			HttpSession session = request.getSession();//获取session
			session.setAttribute("username", username);//向session域中保存用户名
			response.sendRedirect("/day11_3/session2/succ1.jsp");
		} else {//登录失败
			/*
			 * 4. 如果失败
			 *   > 保存错误信息到request域中
			 *   > 转发到login.jsp
			 */
			request.setAttribute("msg", "用户名或密码错误!");
			RequestDispatcher qr = request.getRequestDispatcher("/session2/login.jsp");//得到转发器
			qr.forward(request, response);//转发
		}
	}
}
