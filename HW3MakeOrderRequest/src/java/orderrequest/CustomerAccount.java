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


public class CustomerAccount {
   
    private String accountId;
    private String password;
    private String cardNumber;
    private String customerEmail;
    
    public String readAccountInfo(String accId, String pass){ 
        //if (accountId == accId && password == pass){
        return customerEmail;
        
        }
    public String createAccount(String acctId, String pass, String cardNo, String email){
        accountId = acctId;
        password = pass;
        cardNumber = cardNo;
        customerEmail = email;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            
            
            String query = "INSERT INTO customer_account(account_id, password, card_no, customer_email) VALUES (?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accountId);
            ps.setString(2, password);
            ps.setInt(3, Integer.parseInt(cardNumber));
            ps.setString(4, customerEmail);
            
            
            ps.executeUpdate();
            
           return email;
            
      }
        
        catch(Exception e){
        e.printStackTrace();
        return "failed";
        }
    
    
    }
    public int updateCardNo(String accountId, String password, int cardNo){return cardNo;}
    
    public void setAccountId(String s){accountId = s;}
    public void setPassword(String s){password = s;}
    public void setCardNumber(String s){cardNumber = s;}
    public void setCustomerEmail(String s){customerEmail = s;}
    
    public String getAccountId(){return accountId;}
    public String getPassword(){return password;}
    public String getCardNumber(){return cardNumber;}
    public String getCustomerEmail(){return customerEmail;}
    
}
