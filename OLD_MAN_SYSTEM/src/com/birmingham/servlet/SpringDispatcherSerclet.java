package com.birmingham.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.DispatcherServlet;

public class SpringDispatcherSerclet extends DispatcherServlet {
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Override
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url=request.getContextPath();
		logger.info("project context:"+url);
		logger.info("request params:"+request.getParameterMap());
		System.out.println("REQUEST PARAMS:"+request.getParameterMap());
		response.setContentType("text/html;charset=UTF-8");  
		// TODO Auto-generated method stub
		super.doService(request, response);
	}

	
}
