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
@RequestMapping("/customer")
public class CustomerController {
    private Logger logger = Logger.getLogger(this.getClass());
    @Autowired
    @Qualifier("ibatisDao")
    private IbatisDao dao;
 @RequestMapping("/list")
 @ResponseBody
 public Map list(@RequestParam Map params,Model model,HttpServletRequest request){
	 Map rst=new HashMap();
	 logger.info("params1=="+params);
	 Integer page=Integer.valueOf(params.get("page").toString().trim());//页数
     Integer limit=Integer.valueOf(params.get("limit").toString().trim());//每页记录数
     int startNum=(page-1)*limit;
     params.put("startNum", startNum);
     params.put("limit", limit);
     logger.info("params2==="+params);
     List list=dao.findList("CUSTOMER.getList", params);
     int count= dao.queryForInt("CUSTOMER.getCount", params);
     

     
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
     
     String isbn="C."+ new Date().getTime();
     params.put("CUSTOMER_ID", isbn);
     logger.info("object******"+params);
     List list =new ArrayList<>();
     list.add(params);
     dao.batch4Update("CUSTOMER.addBatch", list);
     return "/jsp/customer.jsp";
 }
 
 @RequestMapping("/update")
 public String  update(@RequestParam Map params){
     boolean flag=false;
     logger.info("object******"+params);
     List list =new ArrayList<>();
     list.add(params);
     dao.batch4Update("CUSTOMER.updateBatch", list);
     //dao.update("CUSTOMER.updateBatch", params);
     return "/jsp/customer.jsp";
 }
 
 
 @RequestMapping("/toUpdate")
 public String  toUpdate(@RequestParam Map params,Model model){
     Map map=dao.queryForMap("CUSTOMER.signal", params);
     model.addAttribute("obj", map);
     return "/jsp/customer_update.jsp";
 }
 
 
 @RequestMapping("/del")
 @ResponseBody
 public Map  del(@RequestParam Map params){
	 Map rst=new HashMap();
     boolean flag=false;
     logger.info("object******"+params);
     flag= dao.delete("CUSTOMER.delete", params);
     rst.put("flag" , flag);
     return rst;
 }
 @RequestMapping("/signal")
 @ResponseBody
 public Map  signal(@RequestParam Map params){
	 Map rst=new HashMap();
     boolean flag=false;
     logger.info("object******"+params);
     rst= dao.queryForMap("CUSTOMER.signal", params);
     return rst;
 }
 


}
