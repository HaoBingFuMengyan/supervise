package com.frogsing.member.vo;

import java.io.Serializable;
import java.util.Date;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.DateUtils;
import com.frogsing.heart.web.login.ILoginUser;
import com.google.common.base.Objects;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
 */
public class LoginUser extends ILoginUser implements Serializable {
	private static final long serialVersionUID = -1373760761780840081L;

	/**
	 * 
	 * @param id
	 * @param loginName
	 * @param name
	 * @param password
	 * @param usertype
	 * @param bisadmin
	 * @param lastlogintime
	 * @param smemberid
	 * @param membercnname
	 * @param memberno
	 */
	public LoginUser(String id, String loginName, String name, String password, int membertype, int bisadmin,
			Date lastlogintime, String smemberid, String membercnname, String memberno, int authtype, int bissalesman,
			String likename, String smobile,int bisselfsaler) {
		this.id = id;
		this.memberId = smemberid;
		this.loginName = loginName;
		this.name = name;
		this.membertype = membertype;
		this.bisadmin = bisadmin;
		this.lastlogintime = lastlogintime;
		this.password = password;
		this.membercnname = membercnname;
		this.memberno = memberno;
		this.bisadmin = bisadmin;
		this.authtype = authtype;
		this.bissalesman = bissalesman;
		this.slikename = likename;
		this.smobile = smobile;
		this.bisselfsaler=bisselfsaler;

	}

	// public String getDepartmentid() {
	// return departmentid;
	// }
	private String id;
	private String loginName;
	private String name;
	private int bisadmin;
	private Date lastlogintime;
	private String password;
	private String memberId;
	private int membertype;
	private String membercnname;
	private String memberno;
	private int bissalesman;
	private String slikename;
	private String smobile;
	private int bisselfsaler;
	private int imembersitetype;
	public void toSalesman() {
		this.bissalesman = 1;
	}

	private int authtype;

	public int getImembersitetype() {
		return imembersitetype;
	}

	public void setImembersitetype(int imembersitetype) {
		this.imembersitetype = imembersitetype;
	}

	@Override
	public int getMembertype() {
		return membertype;
	}

	public int getBissalesman() {
		return bissalesman;
	}

	public int getAuthtype() {
		return authtype;
	}

	public String getMembercnname() {
		return membercnname;
	}

	public String getMemberno() {
		return memberno;
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.frogsing.krf.service.account.IUser#getId()
	 */
	@Override
	public String getId() {
		return id;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.frogsing.krf.service.account.IUser#getLoginName()
	 */
	@Override
	public String getLoginName() {
		return loginName;
	}

	public int usertype;

	/*
	 * (non-Javadoc)
	 * 
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
		LoginUser other = (LoginUser) obj;
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
		if (lastlogintime == null)
			return "";
		return DateUtils.dateTimeParseString(this.lastlogintime);
	}

	@Override
	public boolean IsAdmin() {

		if (bisadmin == 0)
			return false;
		else
			return true;
	}

	@Override
	public UserType getUsertype() {
		return UserType.user;
	}

	@Override
	public String getPassword() {

		return this.password;
	}

	public static LoginUser u() {
		return ShiroUtils.getCurrentUser();
	}

	public String getSmobile() {
		return smobile;
	}

	public String getSlikename() {
		return slikename;
	}

	@Override
	public String getMemberId() {
		return this.memberId;
	}

	@Override
	public String getMemberName() {
		return this.membercnname;
	}

	public int getBisselfsaler() {
		return bisselfsaler;
	}
	
	

}