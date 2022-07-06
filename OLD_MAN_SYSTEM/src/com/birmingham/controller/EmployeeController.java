package com.birmingham.controller;

import java.util.ArrayList;
import java.util.Date;
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
@RequestMapping("/employee")
public class EmployeeController {
    private Logger logger = Logger.getLogger(this.getClass());
    @Autowired
    @Qualifier("ibatisDao")
    private IbatisDao dao;
 @RequestMapping("/list")
 @ResponseBody
 public Map list(@RequestParam Map params,Model model,HttpServletRequest request){
	 Map rst=new HashMap();
     int page=Integer.valueOf(params.get("page").toString().trim());
     int limit=Integer.valueOf(params.get("limit").toString().trim());
     int startNum=(page-1)*limit;
     params.put("startNum", startNum);
     params.put("limit", limit);
     List list=dao.findList("EMPLOYEE.getList", params);
     int count= dao.queryForInt("EMPLOYEE.getCount", params);
     

     
     logger.info("list***********"+list);
     Map<String,Object> map=new HashMap<String,Object>();
     rst.put("data" , list);
     rst.put("count" , count);
     rst.put("msg" , "success");
     rst.put("code" , 0);
     
     return rst;
     
 }
 
 
 @RequestMapping("/add")
 public String  add(@RequestParam Map params){
     boolean flag=false;
     
     String isbn="E."+ new Date().getTime();
     params.put("EMPLOYEE_ID", isbn);
     logger.info("object******"+params);
     List list =new ArrayList<>();
     list.add(params);
     dao.batch4Update("EMPLOYEE.addBatch", list);
     return "/jsp/employee.jsp";
 }
 
 @RequestMapping("/update")
 public String  update(@RequestParam Map params){
     boolean flag=false;
     logger.info("object******"+params);
     List list =new ArrayList<>();
     list.add(params);
     dao.batch4Update("EMPLOYEE.updateBatch", list);
     return "/jsp/employee.jsp";
 }
 
 
 @RequestMapping("/toUpdate")
 public String  toUpdate(@RequestParam Map params,Model model){
     Map map=dao.queryForMap("EMPLOYEE.signal", params);
     model.addAttribute("obj", map);
     return "/jsp/employee_update.jsp";
 }
 
 
 @RequestMapping("/del")
 @ResponseBody
 public Map  del(@RequestParam Map params){
	 Map rst=new HashMap();
     boolean flag=false;
     logger.info("object******"+params);
     flag= dao.delete("EMPLOYEE.delete", params);
     rst.put("flag" , flag);
     return rst;
 }
 
 @RequestMapping("/signal")
 @ResponseBody
 public Map  signal(@RequestParam Map params){
	 Map rst=new HashMap();
     boolean flag=false;
     logger.info("object******"+params);
     rst= dao.queryForMap("EMPLOYEE.signal", params);
     return rst;
 }

}
