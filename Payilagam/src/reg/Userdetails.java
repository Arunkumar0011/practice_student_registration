package reg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class Userdetails {

	// DB connection
		String DRIVER = "com.mysql.jdbc.Driver";
		Connection con = null;

		public Userdetails() {
			try {
				Class.forName(DRIVER);
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		// Sign up 
		public boolean register(String name, String mobile, String email, String password) {

			boolean isRegister = false;
			try {

				PreparedStatement ps = con.prepareStatement("insert into user_details (name,mobile,email,password) values(?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, mobile);
				ps.setString(3, email);
				ps.setString(4, password);
				ps.execute();
				isRegister = true;

			} catch (Exception e) {
				System.out.print(e);
			}

			return isRegister;
		}

		
		public HashMap login(String email, String password) {

			HashMap hm = new HashMap();
			try {
				
				PreparedStatement ps = con.prepareStatement("select * from user_details where email=? and password=?");
				ps.setString(1, email);
				ps.setString(2, password);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {

					int id = rs.getInt("id");
					String name = rs.getString("name");

					hm.put("id", id);
					hm.put("name", name);
				}

			} catch (Exception e) {
				System.out.print(e);
			}
			return hm;
		}

		
		public ResultSet details(String user_id) {
			ResultSet rs =null;
			try {
				
			
			PreparedStatement ps = con.prepareStatement("select * from user_details where id=? ");
			ps.setString(1, user_id);
			 rs = ps.executeQuery();
			} catch (Exception e) {
				System.out.print(e);
				
			}
			return rs;
		}

		
		// Sign up 
		public boolean editdashboard(String user_id, String name,  String email, String mobile) {

			boolean editstatus = false;
			try {

				PreparedStatement ps = con.prepareStatement("update user_details set name=?,mobile=?,email=? where id=?");
				ps.setString(1, name);
				ps.setString(2, mobile);
				ps.setString(3, email);
				ps.setString(4, user_id);
				ps.execute();
				editstatus = true;

			} catch (Exception e) {
				System.out.print(e);
			}

			return editstatus;
		}



}
