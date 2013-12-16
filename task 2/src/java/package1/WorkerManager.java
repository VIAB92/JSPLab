package package1;
import java.io.*; 
import java.sql.*;
import oracle.jdbc.driver.*;
import java.util.*;

public class WorkerManager {
	
	Connection con;
	public void connectDB()
	{
		Locale.setDefault(Locale.ENGLISH);	
		try
		{
			// загрузка Native-драйвера
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.print("JDBC-Driver is OK!\n");
		}
		catch(java.lang.ClassNotFoundException er) // обработка ошибок при загрузке драйвера
		{
			System.out.print("JDBC-Driver is wrong!\n");
			System.out.println(er.getMessage());
			er.printStackTrace();
			System.exit(0);
		}
		// установление соединения
		String url = new String(""); // инициализации URL-строки
		try
		{
			
			url="jdbc:oracle:thin:@localhost:1521:XE";
			
			// установка имени пользователя
			String userid="system";
			// установка пароля
			String userp="Abacumov3723";
			// открытие соединения
			 con=DriverManager.getConnection(
					url,userid,userp);
			System.out.println("Connection with URL=" + url + " is OK!");
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
	}
	
	public Worker getWorkerById(int id)
	{
		Worker worker = new Worker();
		try
		{
			Statement stm=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String query = "SELECT * FROM employees WHERE employee_id = "+id;
			// выполнение запроса
			ResultSet rz=stm.executeQuery
				(query);
			System.out.println("SELECT - OK!");
			
			// обработка каждой строки ответа на запрос цикла пока метод next() не вернет false
			while(rz.next()) 
			{	
				worker.setWorkerID(rz.getInt(1));
				worker.setFirstName(rz.getString(2));
				worker.setLastName(rz.getString(3));
				worker.setEmail(rz.getString(4));
				worker.setPhone(rz.getString(5));
				worker.setSalary(rz.getDouble("salary"));
									
			}

			rz.close(); // очистка области данных по ответу на запрос
			stm.close(); // очистка данных по запросу
		}
		catch(SQLException er) // обработка ошибок при выполнении запроса
		{	
			System.out.println("SELECT is wrong!");
			System.out.println(er.getMessage());
		}
		return worker;
	}
}
