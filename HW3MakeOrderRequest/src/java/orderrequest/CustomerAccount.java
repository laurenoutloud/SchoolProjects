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
    
    private String accountId = null;
    
    
    public String getAccountId(){return accountId;}
   
    public void setAccountId(String id){this.accountId = id;}
    
    public String testMethod(){
        
        
        return "Hello";
    }
}
