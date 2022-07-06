package com.birmingham.common.util;

import java.security.MessageDigest;

public class MD5Utils {
    public static String toMd5( String str){
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f' };
        try {
            if (str != null && !"".equals(str.trim())) {
                byte[] strTemp = str.getBytes("utf-8");
                MessageDigest mdTemp = MessageDigest.getInstance("MD5");
                mdTemp.update(strTemp);
                byte[] md = mdTemp.digest();
                int j = md.length;
                char str1[] = new char[j * 2];
                int k = 0;
                for (int i = 0; i < j; i++) {
                    byte byte0 = md[i];
                    str1[k++] = hexDigits[byte0 >>> 4 & 0xf];
                    str1[k++] = hexDigits[byte0 & 0xf];
                }
                return new String(str1);
            } else {
                return "";
            }
        } catch (Exception e) {
            return null;
        }
    }
}
