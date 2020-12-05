/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SAMSAM BILAL
 */
public class MyConnection {
    private static Connection con=null;
    public static Connection getMyConnection() {
        if(con==null){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                } catch (SQLException ex) {
                    Logger.getLogger(MyConnection.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }catch(ClassNotFoundException e){
                System.out.println("");
            }
         
        }   return con; 
    }

 
    
}
