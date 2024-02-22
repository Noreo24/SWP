package DBContext;


import Uils.Constants;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBContext {
    
    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
     public Connection getConnection()throws Exception {
        String url = "jdbc:sqlserver://"+Constants.DBCONTEXT_SERVER+":"+Constants.DBCONTEXT_PORT + "\\" + instance +";databaseName="+ Constants.DBCONTEXT_DATABASE;
        if(instance == null || instance.trim().isEmpty())
            url = "jdbc:sqlserver://"+Constants.DBCONTEXT_SERVER+":"+Constants.DBCONTEXT_PORT +";databaseName="+Constants.DBCONTEXT_DATABASE;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, Constants.DBCONTEXT_USER, Constants.DBCONTEXT_PASS);
    }   
    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
<<<<<<< HEAD
    private final String serverName = "ADMIN-PC\\MSSQLTUNG";// sua theo sql cua moi nguoi
    
    private final String dbName = "Phone_Shop_Online_2";
    private final String portNumber = "1433";
=======
 
>>>>>>> 51d25809906605ac8e4ce6aa7ab5edf1d3e40558
    private final String instance="";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
 
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnection());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}