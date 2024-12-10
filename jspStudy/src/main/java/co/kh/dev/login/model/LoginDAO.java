package co.kh.dev.login.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import co.kh.dev.account.model.AccountVO;
import co.kh.dev.common.DBUtility;

public class LoginDAO {
	private final String INSERT_SQL = "INSERT INTO LOGIN VALUES(LOGIN_SEQ.NEXTVAL,?,?,?,?,?)";
	private final String SELECT_SQL = "select * from login where id = ?";
//	private final String SELECT_SQL = "SELECT * FROM LOGIN ORDER BY NO";
//	private final String SELECT_LOGIN_CHECK_SQL = "SELECT * FROM LOGIN WHERE ID = ? AND PWD = ?";
//	private final String DELETE_SQL = "DELETE FROM LOGIN WHERE NO = ?";
//	private final String UPDATE_SQL = "UPDATE LOGIN SET NAME= ? , PWD = ? WHERE ID = ?";

//	로그인 체크
	public boolean loginDB(LoginVO lvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean returnFlag = false;
		String idChk = null;
		String passChk = null;
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			pstmt.setString(1, lvo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				idChk = rs.getString("id");
				passChk = rs.getString("password");
				// 3. 체크확인해서 로그인 인정이 되면 세션을 만들어서 저장한다.
				if (lvo.getId().equals(idChk) && lvo.getPassword().equals(passChk)) {
					returnFlag = true;
				} else {
					System.out.println("아이디 비밀번호가 맞지 않습니다.");
				}
			}else {
				System.out.println("세션이 없습니다.");
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
		}finally {
			DBUtility.dbClose(con, pstmt, rs);
		}
		return returnFlag;
	}

//	 마이페이지 정보 출력
	public LoginVO mypageDB(LoginVO lvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		LoginVO lvo2 = new LoginVO();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			pstmt.setString(1, lvo.getId());
			rs = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("NO");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				lvo2 = new LoginVO(no, name, id, password, phone, address);
			} else {
				lvo2 = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lvo2;
	}

//	회원가입
	public Boolean insertDB(LoginVO lvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";

		int count = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "webuser", "123456");
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, lvo.getName());
			pstmt.setString(2, lvo.getId());
			pstmt.setString(3, lvo.getPassword());
			pstmt.setString(4, lvo.getPhone());
			pstmt.setString(5, lvo.getAddress());
			count = pstmt.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
			if (pstmt != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}
		return (count == 0) ? false : true;
	}

//	public Boolean deleteDB(AccountVO mvo) {
//		Connection con = DBUtility.dbCon();
//		PreparedStatement pstmt = null;
//		int rs = 0;
//		try {
//			pstmt = con.prepareStatement(DELETE_SQL);
//			pstmt.setInt(1, mvo.getNo());
//			rs = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return (rs == 0) ? false : true;
//	}

//	public Boolean updateDB(AccountVO mvo) {
//		Connection con = DBUtility.dbCon();
//		PreparedStatement pstmt = null;
//		int rs = 0;
//		try {
//			pstmt = con.prepareStatement(UPDATE_SQL);
//			pstmt.setString(1, mvo.getName());
//			pstmt.setString(2, mvo.getPwd());
//			pstmt.setString(3, mvo.getId());
//			rs = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return (rs == 0) ? false : true;
//	}
}
