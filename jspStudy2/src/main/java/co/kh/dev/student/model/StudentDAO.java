package co.kh.dev.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import co.kh.dev.account.model.AccountVO;
import co.kh.dev.common.ConnectionPool;
import co.kh.dev.common.DBUtility;


public class StudentDAO {
	private static StudentDAO studentDAO;
	
	private StudentDAO() {};
	
	public static synchronized StudentDAO getInstance() {
		if(studentDAO==null) {
			studentDAO = new StudentDAO();
		}
		return studentDAO;
	}
	
	private final String SELECT_SQL = "SELECT * FROM STUDENT";
	private final String SELECT_ONE_SQL = "SELECT * FROM STUDENT WHERE ID = ?";
	private final String SELECT_BY_ID_SQL = "SELECT COUNT(*) AS COUNT FROM STUDENT WHERE ID = ?";
	private final String SELECT_LOGIN_SQL = "SELECT PASS FROM STUDENT WHERE ID = ?";
	private final String INSERT_SQL = "insert into student values(?,?,?,?,?,?,?,?,?,?)";
	private final String DELETE_SQL = "DELETE FROM STUDENT WHERE ID = ?";
	private final String UPDATE_SQL = "update student set pass=?, phone1=?, phone2=?, phone3=?, email=?, zipcode=?, address1=?, address2=? where id=?";
	private final String SELECT_ZIP_SQL = "select * from zipcode where dong like ?";
	/*
	 * "select * from zipcode where dong like ?+'%'"
	 * ="select * from zipcode where dong like ''박촌'%'"
	 */
	
	// 전체를 DB에서 출력
	public ArrayList<StudentVO> selectDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StudentVO> tmList = new ArrayList<StudentVO>();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("ID");
				String passwd = rs.getString("passwd");
				String name = rs.getString("NAME");
				String memNum1 = rs.getString("mem_Num1");
				String memNum2 = rs.getString("mem_Num2");
				String e_mail = rs.getString("E_MAIL");
				String phone = rs.getString("phone");
				String zipcode = rs.getString("zipcode");
				String address = rs.getString("address");
				String job = rs.getString("job");
				StudentVO tmvo = new StudentVO(id, passwd, name, memNum1, memNum2, e_mail, phone, zipcode, address, job);
				tmList.add(tmvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return tmList;
	}

	
	public StudentVO selectOneDB(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentVO resultVO = null;
		try {
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setString(1, svo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String id = rs.getString("ID");
				String pass = rs.getString("pass");
				String name = rs.getString("NAME");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String email = rs.getString("EMAIL");
				String zipcode = rs.getString("zipcode");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				resultVO = new StudentVO(id, pass, name, phone1, phone2, phone3, email, zipcode, address1, address2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return resultVO;
	}
	
	
	public int selectLoginCheck(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;	//id가 없음
		String pass = null;
		try {
			pstmt = con.prepareStatement(SELECT_LOGIN_SQL);
			pstmt.setString(1, svo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString("PASS");
				//1일때는 모두 맞음, 0일때는 아이디는 맞고 비밀번호가 틀림
				check = (pass.equals(svo.getPass()))?(1):(0);
			}else {
				check=-1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return check;
	}
	
	
	public boolean selectIdCheck(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SELECT_BY_ID_SQL);
			pstmt.setString(1, svo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return (count!=0)?(true):(false);
	}

	
	public boolean updateDB(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			 pstmt = con.prepareStatement(UPDATE_SQL);
	         pstmt.setString(1,svo.getPass());
	         pstmt.setString(2,svo.getPhone1());
	         pstmt.setString(3,svo.getPhone2());
	         pstmt.setString(4,svo.getPhone3());
	         pstmt.setString(5,svo.getEmail());
	         pstmt.setString(6,svo.getZipcode());
	         pstmt.setString(7,svo.getAddress1());
	         pstmt.setString(8,svo.getAddress2());
	         pstmt.setString(9,svo.getId());
	         count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count>0) ? true : false;
	}
	
	
	public boolean deleteDB(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(DELETE_SQL);
			pstmt.setString(1,svo.getId());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count>0) ? true : false;
	}
	
	
	public Boolean insertDB(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			 pstmt = con.prepareStatement(INSERT_SQL);
	         pstmt.setString(1,svo.getId());
	         pstmt.setString(2,svo.getPass());
	         pstmt.setString(3,svo.getName());
	         pstmt.setString(4,svo.getPhone1());
	         pstmt.setString(5,svo.getPhone2());
	         pstmt.setString(6,svo.getPhone3());
	         pstmt.setString(7,svo.getEmail());
	         pstmt.setString(8,svo.getZipcode());
	         pstmt.setString(9,svo.getAddress1());
	         pstmt.setString(10,svo.getAddress2());
	         count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count>0) ? true : false;
	}
	
	
	public ArrayList<ZipCodeVO> selectZipCode(ZipCodeVO zvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ZipCodeVO> zipList = new ArrayList<ZipCodeVO>();
		try {
			pstmt = con.prepareStatement(SELECT_ZIP_SQL);
			String dongValue = "%"+zvo.getDong()+"%";	//'박촌동%'
			pstmt.setString(1, dongValue);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong = rs.getString("dong");
				String bunji = rs.getString("bunji");
				ZipCodeVO obj = new ZipCodeVO(zipcode, sido, gugun, dong, bunji);
				zipList.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return zipList;
	}

}
