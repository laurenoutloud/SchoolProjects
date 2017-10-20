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
    private static Connection con = null;
    
    public static Connection getCon(){
        try{
            con= DriverManager.getConnection("jdbd:mysql://localhost:3306/obs?" + "user=root&password=admin");
        }
        catch(Exception e){}
        return con;
    }
}
