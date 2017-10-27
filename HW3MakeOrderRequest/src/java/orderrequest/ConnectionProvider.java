/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orderrequest;

/**
 *
 * @author Lauren
 */

import java.sql.*;
import java.math.*;

public class ConnectionProvider {
    //private static Connection con = null;
    
    public static Connection getCon(){
        Connection con = null;
        try{
           Class.forName("*com.mysql.jdbc.driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
           if (con==null){
               System.out.println("connection failed");
            }
           else{
                    System.out.println("connection success");

           }
        }
        catch(Exception e){
        e.printStackTrace();
        }
        return con;
    }
}
