package co.kh.dev.customer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.kh.dev.common.ConnectionPool;
import co.kh.dev.common.DBUtility;

public class CustomerDAO {
	public final String SELECT_SQL = "SELECT ID, PWD FROM CUSTOMER WHERE ID = ?";
	public final String SELECT_ID_SQL = "SELECT COUNT(*) AS COUNT FROM CUSTOMER WHERE ID = ?";
	public final String INSERT_SQL = "INSERT INTO CUSTOMER VALUES(?,?,?,?,?,?,?,?,?,?)";
	
	public boolean selectCustomer(CustomerVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean returnFlag = false;
		String idChk = null;
		String passChk = null;
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			pstmt.setString(1, svo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				idChk = rs.getString("id");
				passChk = rs.getString("pwd");
				// 3. 체크확인해서 로그인 인정이 되면 세션을 만들어서 저장한다.
				if (svo.getId().equals(idChk) && svo.getPwd().equals(passChk)) {
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
			cp.dbClose(con, pstmt, rs);
		}
		return returnFlag;
	}
	
 	public boolean idCheck(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt=con.prepareStatement(SELECT_ID_SQL);
			pstmt.setString(1, cvo.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
			count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return (count==0)?(true):(false);
	}

	public boolean insertDB(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		
		try {
			pstmt=con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, cvo.getId());
			pstmt.setString(2, cvo.getPwd());
			pstmt.setString(3, cvo.getName());
			pstmt.setString(4, cvo.getPhone1());
			pstmt.setString(5, cvo.getPhone2());
			pstmt.setString(6, cvo.getPhone3());
			pstmt.setString(7, cvo.getEmail());
			pstmt.setString(8, cvo.getZipcode());
			pstmt.setString(9, cvo.getAddress1());
			pstmt.setString(10, cvo.getAddress2());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count!=0)?(true):(false);
	}
	
}
