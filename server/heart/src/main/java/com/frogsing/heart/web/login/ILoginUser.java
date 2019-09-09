package com.frogsing.heart.web.login;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;

import java.io.Serializable;

public abstract class ILoginUser {

	public abstract String getId();

	public abstract String getLoginName();

	public abstract UserType getUsertype();

	public abstract String getName();

	public abstract String getLastlogintime();

	public abstract boolean IsAdmin();

	public abstract String getPassword();
	
	public abstract String getMemberId();
	
	public abstract String getMemberName();

	public abstract int getAuthtype();

	public abstract String getMembercnname();

	public abstract String getMemberno();

	public abstract int getMembertype();



	public static ILoginUser system() {
		U u=new U("system");
		return u;
	}
	public  static class  U extends ILoginUser implements Serializable{

		private String loginName;
		public  U(){
		}
		public  U(String loginName){
			this.loginName=loginName;
		}
		@Override
		public String getId() {
			return loginName;
		}

		@Override
		public String getLoginName() {
			return loginName;
		}

		@Override
		public UserType getUsertype() {
			return UserType.admin;
		}

		@Override
		public String getName() {
			return loginName;
		}

		@Override
		public String getLastlogintime() {
			return null;
		}

		@Override
		public boolean IsAdmin() {
			return false;
		}

		@Override
		public String getPassword() {
			return null;
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
			return null;
		}

		@Override
		public String getMemberno() {
			return null;
		}

		@Override
		public int getMembertype() {
			return 0;
		}

	}
}