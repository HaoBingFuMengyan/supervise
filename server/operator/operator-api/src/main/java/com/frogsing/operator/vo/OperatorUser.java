package com.frogsing.operator.vo;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;
import com.frogsing.heart.utils.DateUtils;
import com.frogsing.heart.web.login.ILoginUser;
import com.google.common.base.Objects;

import java.io.Serializable;
import java.util.Date;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
 */
public  class OperatorUser extends  ILoginUser implements Serializable {
	private static final long serialVersionUID = -1373760761780840081L;
	private String id;
	private String loginName;
	private String name;
	private int bisadmin;
	private Date lastlogintime;
	private String password;
	
	public OperatorUser(String id, String loginName, String name,String password,int usertype,int bisadmin,Date lastlogintime) {
		this.id = id;
		this.loginName = loginName;
		this.name = name;
		this.usertype=usertype;
		this.bisadmin=bisadmin;
		this.lastlogintime=lastlogintime;
		this.password=password;
		
	}
	public void setLastlogintime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}

	public int getBisadmin() {
		return bisadmin;
	}

	public void setBisadmin(int bisadmin) {
		this.bisadmin = bisadmin;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.krf.service.account.IUser#getId()
	 */
	@Override
	public String getId() {
		return id;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.krf.service.account.IUser#getLoginName()
	 */
	@Override
	public String getLoginName() {
		return loginName;
	}

	
	public int usertype;

	

	/* (non-Javadoc)
	 * @see com.frogsing.krf.service.account.IUser#getName()
	 */
	@Override
	public String getName() {
		return name;
	}

	/**
	 * 本函数输出将作为默认的<shiro:principal/>输出.
	 */
	@Override
	public String toString() {
		return loginName;
	}

	/**
	 * 重载hashCode,只计算loginName;
	 */
	@Override
	public int hashCode() {
		return Objects.hashCode(loginName);
	}

	/**
	 * 重载equals,只计算loginName;
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		OperatorUser other = (OperatorUser) obj;
		if (loginName == null) {
			if (other.loginName != null) {
				return false;
			}
		} else if (!loginName.equals(other.loginName)) {
			return false;
		}
		return true;
	}

	@Override
	public String getLastlogintime() {
		if(lastlogintime==null)
			return"";
		return DateUtils.dateTimeParseString(this.lastlogintime);
	}

	@Override
	public boolean IsAdmin() {
		
		if(bisadmin==0)
			return false;
		else
			return true;
	}

	@Override
	public UserType getUsertype() {
		return UserType.admin;
	}

	@Override
	public String getPassword() {
		
		return this.password;
	}
	@Override
	public String getMemberId() {
		
		return null;
	}
	@Override
	public String getMemberName() {
		return null;
	}
	@Override
	public int getAuthtype() {
		return 0;
	}
	@Override
	public String getMembercnname() {
		return "本平台";
	}
	@Override
	public String getMemberno() {
		return "";
	}

	@Override
	public int getMembertype() {
		return -1;
	}


}