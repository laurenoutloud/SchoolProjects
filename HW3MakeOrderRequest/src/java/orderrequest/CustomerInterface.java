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
public class CustomerInterface {
  private PurchaseOrderManager manager = new PurchaseOrderManager(); 
 
   
  

  public boolean verifyAccount(String accountId, String password){
      
      return manager.verifyAccount(accountId, password);
  }
  
  public String getEmail(String accountId, String password){
      
      return manager.getEmail(accountId, password);
  }
  
  public String request(String accountId, String password, String item, String quantity, String totalPrice){
     
        String confirmation;
        //manager = new PurchaseOrderManager();
        confirmation = manager.requestOrder(accountId, password, item, quantity, totalPrice);
      
        return confirmation;
     
      
      /*try{
           
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            Class.forName("com.mysql.jdbc.Driver");
            
            ResultSet rs = mystmt.executeQuery("select * from customer_account");
            while (rs.next()){
                System.out.println(rs.getString("account_id"));
                test = rs.getString("account_id");
            }
        }
        catch(Exception e){
        e.printStackTrace();
        }
    
      return false;
  }
  public void setTest(String s){
      test = s;
      
      try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            
            ResultSet rs = mystmt.executeQuery("SELECT item FROM delivery_order, customer_account WHERE customer_account.password='7890' AND customer_account.account_id = delivery_order.account_id");
            while (rs.next()){
                //System.out.println(rs.getString("account_id"));
                test = rs.getString("item");
            }
            
            
            String query = "INSERT INTO delivery_order(account_id, item, quantity, total_price, authorization_no) VALUES (?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, "bob");
            ps.setString(2, "table");
            ps.setInt(3, 3);
            ps.setInt(4, 100);
            ps.setInt(5, 88888);
            
            ps.executeUpdate();
            
      }
        
        catch(Exception e){
        e.printStackTrace();
        
        test = "failed";
        }
      
      */
      
      
  }
  public String getCreditCardNumber(){
      return manager.getCreditCardNumber();
  }

  public String createAccountRequestOrder(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice){
      
      return manager.createAccRequestOrder(accountId, password, cardNo, email, item, quantity, totalPrice);
      
    
  }
  public String requestOrderWithNewCardNo(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice){
      
      return manager.requestOrderWithNewCard(accountId, password, cardNo, email, item, quantity, totalPrice);
  }
  public void cancel(){}
}
