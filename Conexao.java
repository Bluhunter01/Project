

import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexao {

  private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
  private static final String URL = "jdbc:mysql://localhost:3306/hostear?useTimezone=true&serverTimezone=UTC&useSSL=false";
  private static final String USER = "root";
  private static final String PASS = "112233@Is";
  
  
  

  public static Connection getConnection(){
    Connection connection = null;

    try {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, USER, PASS);
      } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Erro de conexão");
      } catch (ClassNotFoundException ex) {
        JOptionPane.showMessageDialog(null, "Servidor não encontrado");

      }

      
    return connection;

    
  }
  
  
  public static void closeConnection(Connection connection){
    try {

      if (connection!= null && !connection.isClosed()){
        connection.close();
        JOptionPane.showMessageDialog(null, "Desconectado do servidor");
      }
      
    } catch (SQLException ex) {
      JOptionPane.showMessageDialog(null, "Não foi possivel desconectar");
    }

    
  }
  public static void closeConnection(Connection connection, PreparedStatement stmt){
    
    closeConnection(connection);

    
    try {

      if(stmt != null){
        stmt.close();
      }
      
    } catch (SQLException ex) {
      System.out.println("Não foi possivel executar a ordem");
    }

    
  }
  
  public static void closeConnection(Connection connection, PreparedStatement stmt, ResultSet rs){
    
    closeConnection(connection, stmt);

    
    try {

      if(rs != null){
        rs.close();
      }
      
    } catch (SQLException ex) {
      System.out.println("Não foi possivel exibir resultado");
    }

    
  }
}

