// 적용 못함.. 

package com.semi.bandi.join.util;

import java.security.MessageDigest;

//이메일 값에 해시값을 적용해서 사용자가 그것을 인증코드로 링크타고 인증 할 때 사용 하는 암호화
public class SHA256 {
	public static String getSHA256(String input){
		StringBuffer result = new StringBuffer();
		try{
			//SHA-256해쉬코드 얻기 
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			
			//암호화 된 코드에 소금쳐서 더 짜게짜게 만듬
			byte[] salt = "소금이나 처먹어라".getBytes();
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			//0xff 자바에서 byte자료형의 범위는 -128~127까지 
			//8bit지만 맨 앞 비트는 부호를 표현하기 때문에 사실상 7개의 비트로만 수를 표현
			//따라서 어떠한 수를 16진수로 표현할때 -128~127이 아닌
			//0~256과 같은 int형으로 표현하고 싶을때 
			//0xff(256) 을 뒤에 붙을 16진수에 &(and)연산으로 가져다가 붙여버리면
			//맨 앞자리가 1이라고 음수로 값이 튀어 나오는 상황을 막을 수 있다...
			//and연산 ex) 001
			//		and	011
			//       =  001 (두 값이 같을 때 만 그 값을 산출 다르면 0을 산출)
			for(int i = 0; i < chars.length; i++){
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) result.append("0");	
				result.append(hex);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result.toString();
	}
}
