package git;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class db_check {
	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/school";	//db url		localhost �ڿ� /database �̸��� �ٿ� �ش� database�� ��� �����ϴ�
		String id = "root";	//db id
		String password = "1234";	//db ��й�ȣ

		Connection con = null;	//db ����
		Statement st = null;	//���ǹ��� ����ϱ� ���� ����
		ResultSet rs = null;	//������� �޾ƿ��� ���� ����
		
		try {
			con = DriverManager.getConnection(url, id, password);	//url, id, password�� db�� ������ db�� ������

			st = con.createStatement();	//db�� �������� �����Ѵٴ� ����
			rs = st.executeQuery("show tables");		//SHOW DATABASES�� ���� ��

			if (st.execute("show tables")) {		//SHOW DATABASES�� ����
				rs = st.getResultSet();	//SHOW DATABASES�� ������� �޾ƿ�
			}

			while (rs.next()) {
				String str = rs.getNString(1);	//�޾ƿ� ������� str�� ����
				System.out.println(str);		//str ���
			}
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());
		}
	}
}