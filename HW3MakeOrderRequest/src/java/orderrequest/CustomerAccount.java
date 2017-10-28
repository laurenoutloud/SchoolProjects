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

//Stores customer account information and adds it to the database
public class CustomerAccount {

    private String accountId;
    private String password;
    private String cardNumber;
    private String customerEmail;
    private Connection con;

    public String readAccountInfo(String accId, String pass) {
        //make sure email and password are correct
        if (accountId.equals(accId) && password.equals(pass)) {
            return customerEmail;
        }
        //return if unable to retrieve email address
        return "Nope";
    }
    //store customer information and create account
    public String createAccount(String acctId, String pass, String cardNo, String email) {
        accountId = acctId;
        password = pass;
        cardNumber = cardNo;
        customerEmail = email;
    
        try {
            //conect to database
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request", "root", "admin");
            Statement mystmt = con.createStatement();

            //write SQL query to update code in database
            String query = "INSERT INTO customer_account(account_id, password, card_no, customer_email) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, accountId);
            ps.setString(2, password);
            ps.setInt(3, Integer.parseInt(cardNumber));
            ps.setString(4, customerEmail);

            ps.executeUpdate();

            return email;

        } catch (Exception e) {
            e.printStackTrace();
            return "failed";
        }

    }
    
    //Update customer credit card number
    public void updateCardNo(String accountId, String password, String cardNo) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            
            //SQL query to update credit card
            String query = "UPDATE customer_account SET card_no = ? WHERE account_id ='" + accountId +"' AND password ='"+password+"'";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(cardNo));
      
            
            ps.executeUpdate();
            //Create order request and return order confirmation
            
            
      }
        
        catch(Exception e){
        e.printStackTrace();
        
        }
        return;
    }
    //Getters and setters for variables
    public void setAccountId(String s) { accountId = s;}
    public void setPassword(String s) {password = s;}
    public void setCardNumber(String s) {cardNumber = s;}
    public void setCustomerEmail(String s) { customerEmail = s;}

    public String getAccountId() { return accountId;}
    public String getPassword() {return password;}
    public String getCardNumber() {return cardNumber;}
    public String getCustomerEmail() {return customerEmail;}

}
