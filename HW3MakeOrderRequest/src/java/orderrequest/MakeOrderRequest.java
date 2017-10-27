/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orderrequest;

import java.sql.*;


/**
 *
 * @author Lauren
 */
public class MakeOrderRequest {
    
     public static void main(String[] args) {
       try{
            Connection con= null;
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            ResultSet rs = mystmt.executeQuery("select * from customer_account");
            while (rs.next()){
                System.out.println(rs.getString("account_id"));
            }
        }
        catch(Exception e){
        e.printStackTrace();
        }
    }
    
}
