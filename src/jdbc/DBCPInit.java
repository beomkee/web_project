package jdbc;

import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;

public class DBCPInit extends HttpServlet {
	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}

	private void loadJDBCDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("fail to load JDBC Driver", e);
		}
	}

	private void initConnectionPool() {
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
			String username = "scott";
			String passwd = "1111";
			ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(jdbcUrl, username, passwd);
			PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connectionFactory, null);
			poolableConnectionFactory.setValidationQuery("select 1");
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setTestWhileIdle(true);
			poolConfig.setMinIdle(4);
			poolConfig.setMaxIdle(50);
			GenericObjectPool<PoolableConnection> connectionPoll = new GenericObjectPool<>(poolableConnectionFactory, poolConfig);
			poolableConnectionFactory.setPool(connectionPoll);
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("mypool", connectionPoll);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
