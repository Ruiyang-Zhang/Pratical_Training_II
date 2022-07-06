package com.birmingham.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.birmingham.dao.IbatisDao;


@Controller
public class LoginController {
    private Logger logger = Logger.getLogger(this.getClass());
    @Autowired
    @Qualifier("ibatisDao")
    private IbatisDao dao;
 @RequestMapping("/user/login")
 public String login(@RequestParam Map params,Model model,HttpServletRequest request){
	 Map rst=new HashMap();
     List list=dao.findList("USER_INFO.login", params);
     logger.info("处理结果"+list);
     if(list.size()>0){
    	 model.addAttribute("STATUS", "1");
    	 model.addAttribute("MSG", "登录成功");
    	 HttpSession session=request.getSession();
    	 session.setAttribute("user", list.get(0));
    	 model.addAttribute("USER", list.get(0));
    	 return"/jsp/menu.jsp";
     }else{
    	 model.addAttribute("STATUS", "0");
    	 model.addAttribute("MSG", "用户名或密码错误！");
    	 return"/jsp/login.jsp";
     }
     
 }
 
 @RequestMapping("/user/loginOut")
 public String loginOut(HttpServletRequest request){

     HttpSession session=request.getSession();
         session.invalidate();
     //销毁session 退出
     return "/jsp/login.jsp";
 }

}
