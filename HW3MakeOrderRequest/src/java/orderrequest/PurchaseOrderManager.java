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
    
    private BankInterface bank = new BankInterface();
    private  EmailServerInterface emailServer = new EmailServerInterface();
    private CustomerAccount customer = new CustomerAccount();
    private DeliveryOrder order = new DeliveryOrder();
    private Connection con; //database connection variabe
    
    //function to verify account
    public boolean verifyAccount(String accountId, String pass){
        
        //check if username/password combination user entered exists in database
        
         try{
             //Create connection to my local database
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            //store SQL query in a string; query gets all rows that contain the username and password entered by the user
            String selectQuery = "SELECT * FROM customer_account WHERE customer_account.account_id ='" + accountId + "' AND customer_account.password='" + pass + "'";
            //execute query and store in set
            ResultSet rs = mystmt.executeQuery(selectQuery);
            
            
            while(rs.next()){
           //if a row in the database was found with the username and password given
           if(rs.getString("account_id") != null && rs.getString("password") != null){
                
                //get additional customer information from database and update customer object
                customer.setAccountId(rs.getString("account_id"));
                customer.setPassword(rs.getString("password"));
                customer.setCardNumber(Integer.toString(rs.getInt("card_no")));
                customer.setCustomerEmail(rs.getString("customer_email"));
              
             //return true because customer was found and therefore verified
            return true;  
           }
         }
            //return false if customer was not found
           return false;
      }
        
        catch(Exception e){
        e.printStackTrace();
        //also return false if exception was thrown 
       return false;
        }
         
    }
    
  
    //create an order request
    public String requestOrder(String accountId, String pass, String item, String quantity, String totalPrice){
            String confirmation;
                //generate random 7 digit numbers for authorization numbers
                Random rand = new Random();
                int r = rand.nextInt(9000000) + 1000000;
                
             //create order request and return confirmation string
            confirmation = order.createOrder(accountId, item, Integer.parseInt(quantity), Integer.parseInt(totalPrice), r);    
            
            //send user email to EmailServerInterface
            emailServer.emailConfirmation(customer.getCustomerEmail());
            
            return confirmation;
      
    }
    
    //If user did not have an account, first create account and then request order
    public String createAccRequestOrder(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice){
          
           customer.createAccount(accountId, password, cardNo, email);
           
           return requestOrder(accountId, password, item, quantity, totalPrice);
    }
            
    //If user had an account but the credit card was denied, update credit card in database before creating order request
    public String requestOrderWithNewCard(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice){
        
        customer.updateCardNo(accountId, password, cardNo);
        return requestOrder(accountId, password, item, quantity, totalPrice);
    }
    
    //function gets credit card number for bank to verify
    public String getCreditCardNumber(){
        return customer.getCardNumber();
    }
    //function gets email for email confirmation
    public String getEmail(String accountId, String password){
        return customer.readAccountInfo(accountId, password);
    }
}
