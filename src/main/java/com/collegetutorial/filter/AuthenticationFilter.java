package com.collegetutorial.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/pages/*" })
public class AuthenticationFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();

		// Check if logged in
		HttpSession session = req.getSession(false);
		boolean loggedIn = session != null && session.getAttribute("userWithSession") != null;

		if (!loggedIn && (uri.endsWith("Login.jsp") || uri.endsWith("LogInController"))) {
			chain.doFilter(request, response);
			return;
		}
		// Skipping filter for login page and login controller
		if (loggedIn) {
			if (uri.endsWith("Login.jsp") || uri.endsWith("LogInController")) {

				res.sendRedirect(req.getContextPath() + "/pages/Dashboard.jsp");
			} else {
				chain.doFilter(request, response);
				return;
			}
		} else {
			res.sendRedirect(req.getContextPath() + "/pages/Login.jsp");
		}

	}
}