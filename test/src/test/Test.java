/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

/**
 *
 * @author Lauren
 */
import java.sql.*;
public class Test {

    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) {
       try{
           String accID = "alex";
           accID = "'"+ accID + "'";
           Connection con= null;
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            
            ResultSet rs = mystmt.executeQuery("SELECT account_id, password FROM customer_account WHERE account_id = " + accID);
            //ResultSet rs = mystmt.executeQuery("SELECT account_id, password FROM customer_account WHERE account_id ='alex'");
           
            /*ResultSet rs = mystmt.executeQuery("select * from customer_account"); */
            while (rs.next()){
                String user = rs.getString("account_id");
                String pass = rs.getString("password");
                System.out.println(user);
                System.out.println(pass);
            }
        }
        catch(Exception e){
        e.printStackTrace();
        }
    }
    
}
