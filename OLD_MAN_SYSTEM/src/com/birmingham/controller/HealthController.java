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
@RequestMapping("/health")
public class HealthController {
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
     List list=dao.findList("CUSTOMER_HEALTH.getList", params);
     int count= dao.queryForInt("CUSTOMER_HEALTH.getCount", params);
     

     
     logger.info("list***********"+list);
     Map<String,Object> map=new HashMap<String,Object>();
     rst.put("data" , list);
     rst.put("count" , count);
     rst.put("msg" , "success");
     rst.put("code" , 0);
     
     return rst;
     
 }
 
 @RequestMapping("/toAdd")
 public String  toAdd(@RequestParam Map params,Model model){
     boolean flag=false;
     
     Map params2=new HashMap();
     
     params.put("startNum", 0);
     int count1= dao.queryForInt("EMPLOYEE.getCount", params);
     params.put("limit", count1);
     List elist=dao.findList("EMPLOYEE.getList", params);
     
     params2.put("startNum", 0);
     int count2= dao.queryForInt("CUSTOMER.getCount", params2);
     params2.put("limit", count2);
     List clist=dao.findList("CUSTOMER.getList", params2);
     
     
     model.addAttribute("elist", elist);
     model.addAttribute("clist", clist);
     return "/jsp/health_add.jsp";
 }
 
 @RequestMapping("/add")
 public String  add(@RequestParam Map params,Model model){
     boolean flag=false;
     
     String isbn="H."+ new Date().getTime();
     params.put("HEALTH_ID", isbn);
     logger.info("object******"+params);
     List list =new ArrayList<>();
     list.add(params);
     dao.batch4Update("CUSTOMER_HEALTH.addBatch", list);
     return "/jsp/health.jsp";
 }
 
 @RequestMapping("/update")
 public String  update(@RequestParam Map params){
     boolean flag=false;
     logger.info("object******"+params);
     List list =new ArrayList<>();
     list.add(params);
     dao.batch4Update("CUSTOMER_HEALTH.updateBatch", list);
     return "/jsp/health.jsp";
 }
 
 
 @RequestMapping("/toUpdate")
 public String  toUpdate(@RequestParam Map params,Model model){
     boolean flag=false;
     Map params2=new HashMap();
     
     logger.info("params1:"+params);
     params.put("startNum", 0);
     int count1= dao.queryForInt("EMPLOYEE.getCount", params);
     params.put("limit", count1);
     List elist=dao.findList("EMPLOYEE.getList", params);
     
     params2.put("startNum", 0);
     int count2= dao.queryForInt("CUSTOMER.getCount", params2);
     params2.put("limit", count2);
     List clist=dao.findList("CUSTOMER.getList", params2);
     
     
     model.addAttribute("elist", elist);
     model.addAttribute("clist", clist);
     
     logger.info("params2:"+params);
     Map map=dao.queryForMap("CUSTOMER_HEALTH.signal", params);
     model.addAttribute("obj", map);
     return "/jsp/health_update.jsp";
 }
 
 
 @RequestMapping("/del")
 @ResponseBody
 public Map  del(@RequestParam Map params){
	 Map rst=new HashMap();
     boolean flag=false;
     flag= dao.delete("CUSTOMER_HEALTH.delete", params);
     rst.put("flag" , flag);
     return rst;
 }
 @RequestMapping("/signal")
 @ResponseBody
 public Map  signal(@RequestParam Map params){
	 Map rst=new HashMap();
     boolean flag=false;
     logger.info("object******"+params);
     rst= dao.queryForMap("CUSTOMER_HEALTH.signal", params);
     return rst;
 }


}
