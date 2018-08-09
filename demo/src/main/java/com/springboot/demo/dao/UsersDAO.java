package com.springboot.demo.dao;

import com.springboot.demo.db.DBFactory;
import com.springboot.demo.db.Emp;
import com.springboot.demo.db.Usr;
import com.springboot.demo.model.Employee;
import com.springboot.demo.model.UsersModel;

public class UsersDAO {
	private DBFactory dbFactory;
	
	private final String[] columns1 = new String[] {Usr.usrId, Usr.email, Usr.password};
	private final String[] init_reg = new String[] {Usr.email, Usr.password, Usr.active, Usr.otp};
	private final String[] del_otp = new String[] {Usr.otp};
 	
	public UsersDAO() {
		dbFactory = new DBFactory();
	}
	
	public boolean createUser(UsersModel users, String OTP) {
		Object[] data = new Object[] {users.getEmail(), users.getPassword(), "not_act", OTP};
		
		return dbFactory.insert(Usr.table, init_reg, data);
	}
	
	public boolean deleteOTP(String email) {
		Object[] data = new Object[] {0};
		String condition = "email = '" + email + "'";
		return dbFactory.update(Usr.table, del_otp, data, condition);
	}
}
