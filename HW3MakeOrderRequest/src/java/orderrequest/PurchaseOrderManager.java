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
import java.util.Random;

public class PurchaseOrderManager {
    
    private BankInterface bank;
  
    private CustomerAccount customer = new CustomerAccount();
    private DeliveryOrder order = new DeliveryOrder();
    private Connection con;
    
    
    public boolean verifyAccount(String accountId, String pass){
         try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            String selectQuery = "SELECT * FROM customer_account WHERE customer_account.account_id ='" + accountId + "' AND customer_account.password='" + pass + "'";
            
            ResultSet rs = mystmt.executeQuery(selectQuery);
            
            while(rs.next()){
           if(rs.getString("account_id") != null && rs.getString("password") != null){
                
                customer.setAccountId(rs.getString("account_id"));
                customer.setPassword(rs.getString("password"));
                customer.setCardNumber(Integer.toString(rs.getInt("card_no")));
                customer.setCustomerEmail(rs.getString("customer_email"));
                //Try adding new colum to table
                //Try changing order 
                
           //return customer.getCustomerEmail();
            return true;  
           }
         }
           return false;
      }
        
        catch(Exception e){
        e.printStackTrace();
        //return false;
       return false;
        }
         
    }
    
  
    
    public String requestOrder(String accountId, String pass, String item, String quantity, String totalPrice){
       
       
                Random rand = new Random();
                int r = rand.nextInt(9000000) + 1000000;
                
             
            return order.createOrder(accountId, item, Integer.parseInt(quantity), Integer.parseInt(totalPrice), r);
            
      
    }
    

 
    public String createAccRequestOrder(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice){
          
           customer.createAccount(accountId, password, cardNo, email);
           
           return requestOrder(accountId, password, item, quantity, totalPrice);
    }
            
            
    public String requestOrderWithNewCard(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice){
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            
            
           String query = "UPDATE customer_account SET card_no = ? WHERE account_id ='" + accountId +"'";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(cardNo));
            
            
            
            ps.executeUpdate();
            
            return requestOrder(accountId, password, item, quantity, totalPrice);
            
      }
        
        catch(Exception e){
        e.printStackTrace();
        return "failed";
        }
    
    }
    
    public String getCreditCardNumber(){
        return customer.getCardNumber();
    }
    public String getEmail(String accountId, String password){
        return customer.readAccountInfo(accountId, password);
    }
}
