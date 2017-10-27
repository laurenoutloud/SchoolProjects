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
    private int cardNumber;
    private String customerEmail;
    
    public String readAccountInfo(String accId, String pass){ 
        //if (accountId == accId && password == pass){
        //return customerEmail;}
        return customerEmail;
        }
    public void createAccount(String acctId, String pass, int cardNo, String email){
    
    
    
    }
    public int updateCardNo(String accountId, String password, int cardNo){return cardNo;}
    
    public void setAccountId(String s){accountId = s;}
    public void setPassword(String s){password = s;}
    public void setCardNumber(int i){cardNumber = i;}
    public void setCustomerEmail(String s){customerEmail = s;}
    
    public String getAccountId(){return accountId;}
    public String getPassword(){return password;}
    public int getCardNumber(){return cardNumber;}
    public String getCustomerEmail(){return customerEmail;}
    
}
