package co.kh.dev.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

//싱글톤 - new 불가능
public final class ConnectionPool {

	// 1. Oracle Driver를 정적처리해서 로드한다.
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 2. 멤버변수
	private ArrayList<Connection> free;
	private ArrayList<Connection> used; // 사용중인 커넥션을 저장하는 변수
	private int initialCons = 10; // 최초로 초기 커넥션수
	private int maxCons = 20; // 최대 커넥션수
	private int numCons = 0; // 총 Connection 수
	private String id;
	private String pw;
	private String url;

	// 3. 싱글톤(자기참조멤버변수 만든다 - private 생성자함수 만든다, 자기참조멤버변수 겟터)
	private static ConnectionPool cp;

	public static ConnectionPool getInstance() {
		// 딱 1번만 실행한다. 절대 두번 실행하지 않는다.
		try {
			if (cp == null) {
				synchronized (ConnectionPool.class) { // 동기화처리
					cp = new ConnectionPool();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cp;
	}

	// 생성자(arraylist 생성, properties 가져오기, connection 10개 만들어서 free에 넣음)
	private ConnectionPool() {
		// 1. ArrayList 10개까지만 사용
		free = new ArrayList<Connection>(initialCons);
		used = new ArrayList<Connection>(initialCons);

		// 2. db.properties 파일 에서 id, pw 가져오기
		String filePath = "C:\\dev\\eclipseWorkspace\\jspStudy\\src\\main\\java\\co\\kh\\dev\\common\\db.properties";
		Properties pt = new Properties();
		try {
			pt.load(new FileReader(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		id = (pt.getProperty("id"));
		pw = (pt.getProperty("pw"));
		url = (pt.getProperty("url"));

		// 데이터베이스연결된 Connection 10개를 만들어서 free에 connection 저장한다
		while (numCons < initialCons) {
			addConnection();
		}
	}

	// Connection free ArrayList에 추가하는 함수
	private void addConnection() {
		free.add(getNewConnection());
	}

	// Connection을 만들어서 리턴한다.
	private Connection getNewConnection() {
		Connection con = null;

		try {
			con = DriverManager.getConnection(url, id, pw);
			numCons++;
			System.out.println("current connection count = " + numCons);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public synchronized Connection dbCon() {
		// 1. free arrayList에 connection 들어있는지 확인(현재 10개 있을거로 추정)
		Connection con = null;
		if (free.isEmpty()) {
			// 최종 max 20개를 다시 만든다.
			while (numCons < maxCons) {
				addConnection();
			}
		}
		con = free.get(free.size() - 1);
		free.remove(con);
		used.add(con);

		return con;
	}

	public void dbClose(Connection con, ResultSet rs, Statement... stmts) {
		if (con != null) {
			releaseConnection(con);
		}
		for (Statement data : stmts) {
			if (data != null) {
				try {
					data.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
	}

	public void dbClose(Connection con, Statement... stmts) {
		if (con != null) {
			releaseConnection(con);
		}
		for (Statement data : stmts) {
			if (data != null) {
				try {
					data.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}

	}

	public void dbClose(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (con != null) {
			releaseConnection(con);
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
	}

	public void dbClose(Connection con, Statement stmt, ResultSet rs) {
		if (con != null) {
			releaseConnection(con);
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}

	}

	// ConnectionPool에서 만들어진 Connection이면 free arraylist에 반납, 아니면 close
	public synchronized void releaseConnection(Connection con) {
		boolean flag = false;
		if (used.contains(con) == true) {
			used.remove(con);
			numCons--;
			free.add(con);
			numCons++;
			flag = true;
		}
		// ConnectionPool에서 생성한 con이 아님
		try {
			if (flag == false) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//현재 ConnectionPool에 있는 Connection 모두 제거
	public void closeAll() {
		// used에 있는 커넥션을 모두 삭제해 버림.
		for (int i = 0; i < used.size(); i++) {
			Connection _con = (Connection) used.get(i);
			used.remove(i--);
			try {
				_con.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		// free에 있는 커넥션을 모두 삭제해 버림.
		for (int i = 0; i < free.size(); i++) {
			Connection _con = (Connection) free.get(i);
			free.remove(i--);
			try {
				_con.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
	}

}