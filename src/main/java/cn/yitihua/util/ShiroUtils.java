package cn.yitihua.util;
import java.security.MessageDigest;
import java.util.Random;

import org.apache.shiro.crypto.hash.Md5Hash;

public class ShiroUtils {

    /**
     * 生成盐值
     */
    public static String getRandomSalt() {
        Random r = new Random();
        StringBuilder sb = new StringBuilder(16);
        sb.append(r.nextInt(99999999)).append(r.nextInt(99999999));
        int len = sb.length();
        if (len < 16) {
            for (int i = 0; i < 16 - len; i++) {
                sb.append("0");
            }
        }
        String salt = sb.toString();
        return salt;
    }


    /**
     * MD5加密
     */
    public static String getMD5Str(String password,String salt) throws Exception{
        StringBuffer buffer = new StringBuffer(salt);
        buffer.append(password);
        String pString = buffer.toString();
        MessageDigest md = MessageDigest.getInstance("MD5");
        char[] charArray = pString.toCharArray();
        byte[] byteArray = new byte[charArray.length];
        for(int i=0;i<charArray.length;i++){
            byteArray[i] = (byte) charArray[i];
        }
        byte[] mdBytes = md.digest(byteArray);
        StringBuffer hexValue = new StringBuffer();
        for(int i=0;i<mdBytes.length;i++){
            int val = ((int)mdBytes[i])&0xff;
            if(val<16){
                hexValue.append("0");
            }
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
    }

}

