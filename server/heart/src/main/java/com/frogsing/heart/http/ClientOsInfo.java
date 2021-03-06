package com.frogsing.heart.http;

import com.frogsing.heart.http.HeaderUtil.OSTYPE;
import com.frogsing.heart.utils.B;


public class ClientOsInfo {
	/***
	 * 比如 Android_3.0
	 */
	private String osTypeVersion;
	/***
	 * Pad或Phone
	 */
	private String deviceType;
	
	private OSTYPE ostype;
	/***
	 * 只是版本号,例如"4.1.1"
	 */
	private String version;
	public String getOsTypeVersion() {
		return osTypeVersion;
	}
	public void setOsTypeVersion(String osTypeVersion) {
		this.osTypeVersion = osTypeVersion;
	}
	public String getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
	public OSTYPE getOstype() {
		return ostype;
	}
	public void setOstype(OSTYPE ostype) {
		this.ostype = ostype;
	}
	/***
	 * 是否是移动设备
	 * @return
	 */
	public boolean isMobile(){
		return B.N(this.deviceType);
	}
}
