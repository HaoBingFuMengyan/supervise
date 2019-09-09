package com.frogsing.heart.http;

import com.frogsing.heart.utils.B;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/***
 * 
 * @author huangwei
 * @since 2013-08-15
 */
public class HeaderUtil {
	
	public static enum OSTYPE {
		ANDROID("ANDROID", "安卓"), 
		IOS("IOS", "苹果"), 
		WP("WP", "微软"), 
		BLACKBERRY("BLACKBERRY", "黑莓");

		private String nCode;
		private String nLabel;

		private OSTYPE(String _nCode, String _nlabel) {
			this.nCode = _nCode;
			this.nLabel = _nlabel;
		}

		public String val() {
			return nCode;
		}

		public boolean isEq(String i) {
			return nCode.equalsIgnoreCase(i);
		}

		public boolean isNot(String i) {
			
			return !nCode.equalsIgnoreCase(i);
		}
	}
	
	/***
	 * pad
	 */
	public static final String DEVICE_TYPE_PAD="Pad";
	/***
	 * 手机
	 */
	public static final String DEVICE_TYPE_PHONE="Phone";


	/***
	 * 校验渠道终端版本号是否合法,eg:0.0.0.3
	 * 
	 * @param clientVersion
	 * @return true-->合法 ;false-->非法
	 */
	public static boolean verifyClientVersion(String clientVersion) {
		boolean result = Pattern.matches("[\\d\\.]+", clientVersion);
		if (result) {
			result = Pattern.matches("^\\d\\.\\d\\.\\d\\.\\d$", clientVersion);
			return result;
		} else {
			return false;
		}
	}
	
	/**
	 * 根据useragent和手机厂商查手机型号
	 * 
	 * @param UA
	 * @return
	 */
	public static String getMobModel(String UA, String operatingSystem) {
		if (UA == null) {
			return null;
		}
		// 存放正则表达式
		String rex = "";
		// 苹果产品
		if (operatingSystem.indexOf("IOS") != -1) {
			if (UA.indexOf("IPAD") != -1) {// 判断是否为ipad
				return "IPAD";
			}
			if (UA.indexOf("IPOD") != -1) {// 判断是否为ipod
				return "IPOD";
			}
			if (UA.indexOf("IPONE") != -1) {// 判断是否为ipone
				return "IPONE";
			}
			return "IOS DEVICE";

		}
		// 安卓系统产品
		if (operatingSystem.indexOf("ANDROID") != -1) {
			String re = "BUILD";
			rex = ".*" + ";" + "(.*)" + re;
			Pattern p = Pattern.compile(rex, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(UA);
			boolean rs = m.find();
			if (rs) {
				System.out.println("Mobil Model is" + m.group(1));
				return m.group(1);
			}
		}
		return null;
	}

	/**
	 * 判断手机的操作系统 IOS/android/windows phone/BlackBerry
	 * 
	 * @param UA
	 * @return
	 */
	public static ClientOsInfo getMobilOS(String UA) {
		UA=UA.toUpperCase();
		if (UA == null) {
			return null;
		}
		ClientOsInfo osInfo=new ClientOsInfo();
		// 存放正则表达式
		String rex = "";
		// IOS 判断字符串
		String iosString = " LIKE MAC OS X";
		if (UA.indexOf(iosString) != -1) {
			if(isMatch(UA, "\\([\\s]*iPhone[\\s]*;", Pattern.CASE_INSENSITIVE)){
				osInfo.setDeviceType(DEVICE_TYPE_PHONE);
			}else if(isMatch(UA, "\\([\\s]*iPad[\\s]*;", Pattern.CASE_INSENSITIVE)){
				osInfo.setDeviceType(DEVICE_TYPE_PAD);
			}
			rex = ".*" + "[\\s]+(\\d[_\\d]*)" + iosString;
			Pattern p = Pattern.compile(rex, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(UA);
			boolean rs = m.find();
			if (rs) {
				String osVersion= m.group(1).replace("_", ".");
				osInfo.setVersion(osVersion);
//				System.out.println("Mobil OS is" + " IOS" +osVersion);
				osInfo.setOsTypeVersion(OSTYPE.IOS.val()+"_" + osVersion);
				osInfo.setOstype(OSTYPE.IOS);
				return osInfo;
			}
			System.out.println("IOS");
			osInfo.setOsTypeVersion(OSTYPE.IOS.val());
			osInfo.setOstype(OSTYPE.IOS);
			return osInfo;
		}
		// Android 判断
		String androidString = "ANDROID";
		if (UA.indexOf(androidString) != -1) {
			if(isMatch(UA, "\\bMobi", Pattern.CASE_INSENSITIVE)){
				osInfo.setDeviceType(DEVICE_TYPE_PHONE);
			}else {
				osInfo.setDeviceType(DEVICE_TYPE_PAD);
			}
			rex = ".*" + androidString + "[\\s]*(\\d*[\\._\\d]*)";
			Pattern p = Pattern.compile(rex, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(UA);
			boolean rs = m.find();
			if (rs) {
				String version=m.group(1).replace("_", ".");
				osInfo.setVersion(version);
				osInfo.setOsTypeVersion(OSTYPE.ANDROID.val()+"_" + version);
				osInfo.setOstype(OSTYPE.ANDROID);
				return osInfo;
			}
			System.out.println("Android");
			osInfo.setOsTypeVersion(OSTYPE.ANDROID.val());
			osInfo.setOstype(OSTYPE.ANDROID);
			return osInfo;
		}
		// windows phone 判断
		String wpString = "WINDOWS PHONE";
		if (UA.indexOf(wpString) != -1) {
			rex = ".*" + wpString + "[\\s]*[OS\\s]*([\\d][\\.\\d]*)";
			Pattern p = Pattern.compile(rex, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(UA);
			boolean rs = m.find();
			if (rs) {
				String version=m.group(1);
				osInfo.setVersion(version);
				osInfo.setOsTypeVersion(OSTYPE.WP.val()+"_" + version);
				osInfo.setOstype(OSTYPE.WP);
				return osInfo;
			}
			osInfo.setOsTypeVersion(OSTYPE.WP.val());
			osInfo.setOstype(OSTYPE.WP);
			return osInfo;
		}
		// BlackBerry 黑莓系统判断
		String bbString = "BLACKBERRY";
		if (UA.indexOf(bbString) != -1) {
			rex = ".*" + bbString + "[\\s]*([\\d]*)";
			Pattern p = Pattern.compile(rex, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(UA);
			boolean rs = m.find();
			if (rs) {
				System.out.println("Mobil OS is" + " BLACKBERRY " + m.group(1));
				String version=m.group(1);
				osInfo.setVersion(version);
				osInfo.setOsTypeVersion(OSTYPE.BLACKBERRY.val()+"_" + version);
				osInfo.setOstype(OSTYPE.BLACKBERRY);
				return osInfo;
			}
			System.out.println("BLACKBERRY");
			osInfo.setOsTypeVersion(OSTYPE.BLACKBERRY.val());
			osInfo.setOstype(OSTYPE.BLACKBERRY);
			return osInfo;
		}
		if(UA.contains("LINUX")){//android
			if(isMatch(UA, "\\bMobi", Pattern.CASE_INSENSITIVE)){
				osInfo.setDeviceType(DEVICE_TYPE_PHONE);
			}else {
				osInfo.setDeviceType(DEVICE_TYPE_PAD);
			}
			
			 Pattern p = Pattern.compile("U;\\s*(Adr[\\s]*)?(\\d[\\.\\d]*\\d)[\\s]*;",Pattern.CASE_INSENSITIVE);
		        Matcher m = p.matcher(UA);
		        boolean result = m.find();
		        String find_result = null;
		        if (result)
		        {
		            find_result = m.group(2);
		        }
		        if(B.Y(find_result)){
		        	osInfo.setOsTypeVersion(OSTYPE.ANDROID.val());
		        	osInfo.setOstype(OSTYPE.ANDROID);
		        	return osInfo;
		        }else{
		        	osInfo.setVersion(find_result);
		        	osInfo.setOsTypeVersion(OSTYPE.ANDROID.val()+"_"+find_result);
		        	osInfo.setOstype(OSTYPE.ANDROID);
		        	return osInfo;
		        }
		}
		
		//UCWEB/2.0 (iOS; U; iPh OS 4_3_2; zh-CN; iPh4)
		if(UA.matches(".*((IOS)|(iPAD)).*(IPH).*")){
			if(isMatch(UA, "[\\s]*iPh[\\s]*", Pattern.CASE_INSENSITIVE)){
				osInfo.setDeviceType(DEVICE_TYPE_PHONE);
			}else {
				osInfo.setDeviceType(DEVICE_TYPE_PAD);
			}
			 Pattern p = Pattern.compile("U;\\s*(IPH[\\s]*)?(OS[\\s]*)?(\\d[\\._\\d]*\\d)[\\s]*;",Pattern.CASE_INSENSITIVE);
		        Matcher m = p.matcher(UA);
		        boolean result = m.find();
		        String find_result = null;
		        if (result)
		        {
		            find_result = m.group(3);
		        }
		        if(B.Y(find_result)){
		        	osInfo.setOsTypeVersion(OSTYPE.IOS.val());
		        	osInfo.setOstype(OSTYPE.IOS);
		        	return osInfo;
		        }else{
		        	String version=find_result.replace("_", ".");
		        	osInfo.setVersion(version);
		        	osInfo.setOsTypeVersion(OSTYPE.IOS.val()+"_"+version);
		        	osInfo.setOstype(OSTYPE.IOS);
		        	return osInfo;
		        }
		}
		return osInfo;
	}
	public static boolean isMatch(String source,String regx,int flags){
		Pattern p = Pattern.compile(regx,flags);
        Matcher m = p.matcher(source);
        boolean result = m.find();
        return result;
	}

	public static ClientOsInfo getMobileType(HttpServletRequest request){
		String userAgent=request.getHeader("user-agent");  
        return HeaderUtil.getMobilOS(userAgent);
	}
}
