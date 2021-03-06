package com.nitcloud.netdisk.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nitcloud.netdisk.domain.User;


public class UserSessionFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		User user = (User) ((HttpServletRequest)request).getSession().getAttribute("user");

		HttpServletRequest hsr = (HttpServletRequest)request;
		String url = hsr.getRequestURI();
		String contextPath = hsr.getContextPath();		

		if(url.contains("user.action")) {
			if(user == null) {
				String path = ((HttpServletRequest)request).getContextPath();
				((HttpServletResponse)response).sendRedirect(path + "/login.action");
				return;
			} else {
				filterChain.doFilter(request, response);
				return;
			}
		}
		
		if(url.equals(contextPath + "/") || url.equals(contextPath + "/" + "index.jsp")) {
			
			if(user == null) {
				String path = ((HttpServletRequest)request).getContextPath();
				((HttpServletResponse)response).sendRedirect(path + "/login.action");
				return;
			} else {
				String path = ((HttpServletRequest)request).getContextPath();
				((HttpServletResponse)response).sendRedirect(path + "/user.action");
				return;
			}
		} else {
			filterChain.doFilter(request, response);
			return;
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}
	
}
