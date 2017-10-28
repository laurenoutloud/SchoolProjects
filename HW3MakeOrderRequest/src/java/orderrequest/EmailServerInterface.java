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
public class EmailServerInterface {
    String email;
    public void emailConfirmation(String custEmail){
       
        email = custEmail;
        //Email server logic not part of Make Order Request use case
    
    }
}
