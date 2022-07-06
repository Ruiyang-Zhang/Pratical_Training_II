package com.birmingham.common.util;

import java.util.HashMap;
import java.util.Map;

public  class CalculateBMI {
	public static Map calculateBMI(Double body_weight,Double height){
		Map rst=new HashMap();
		Double bmi=0.00;
		Double normalWeight=0.00;
		height=(Double)height/100;
		bmi=(Double)body_weight/(height*height);
		rst.put("score", bmi);
		if(bmi<20){
			rst.put("MSG", "体重不足");	
		}else if(bmi>=20&&bmi<25){
			rst.put("MSG", "体重正常");	
		}else if(bmi>=25&&bmi<30){
			rst.put("MSG", "超重");	
		}else if(bmi>=30&&bmi<40){
			rst.put("MSG", "肥胖");	
		}else if(bmi>=40){
			rst.put("MSG", "病态肥胖");	
		}
		
		return rst;
	}
	public static Double calculateNormalWeight(String gender,Double height){
		Double normal =0.00;
	   if(gender.equals("0")){
		   normal=(height-70)*0.6;
	   }else{
		   
		   normal=(height-80)*0.7;
	   }
	   
		
		return normal;
	}
	
}
