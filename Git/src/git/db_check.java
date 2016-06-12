package git;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class db_check {
	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/school";	//db url		localhost 뒤에 /database 이름을 붙여 해당 database를 사용 가능하다
		String id = "root";	//db id
		String password = "1234";	//db 비밀번호

		Connection con = null;	//db 연동
		Statement st = null;	//질의문을 사용하기 위한 선언
		ResultSet rs = null;	//결과값을 받아오기 위한 선언
		
		try {
			con = DriverManager.getConnection(url, id, password);	//url, id, password를 db에 전달해 db를 연동함

			st = con.createStatement();	//db에 쿼리문을 전달한다는 선언
			rs = st.executeQuery("show tables");		//SHOW DATABASES를 실행 함

			if (st.execute("show tables")) {		//SHOW DATABASES를 실행
				rs = st.getResultSet();	//SHOW DATABASES의 결과값을 받아옴
			}

			while (rs.next()) {
				String str = rs.getNString(1);	//받아온 결과값을 str에 삽입
				System.out.println(str);		//str 출력
			}
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());
		}
	}
}