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

//Customer interface class receives/gives information from/to the business logic and the customer
public class CustomerInterface {

    private PurchaseOrderManager manager = new PurchaseOrderManager(); //create purchase order manager object

    //get information from login jsp page and send to business logic to verify customer information
    public boolean verifyAccount(String accountId, String password) {

        return manager.verifyAccount(accountId, password);
    }
    //gets username and password and returns email address to be used by email server
    public String getEmail(String accountId, String password) {

        return manager.getEmail(accountId, password);
    }

    //If account was varified and credit card was authorized then information from requests is sent to business logic
    public String request(String accountId, String password, String item, String quantity, String totalPrice) {

        String confirmation;
        confirmation = manager.requestOrder(accountId, password, item, quantity, totalPrice);

        return confirmation; //returns confirmation of order

    }

    //gets credit card number to be used by bank actor to verify credit card
    public String getCreditCardNumber() {
        return manager.getCreditCardNumber();
    }

    //If user did not have an account then information is sent from user to createAccRequestOrder function in business logic to create an account and then complete the order
    public String createAccountRequestOrder(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice) {

        return manager.createAccRequestOrder(accountId, password, cardNo, email, item, quantity, totalPrice);

    }

    //If account was verified but the credit card was declined then requestOrderWithCardNo will update the credit card number before creating the order request
    public String requestOrderWithNewCardNo(String accountId, String password, String cardNo, String email, String item, String quantity, String totalPrice) {

        return manager.requestOrderWithNewCard(accountId, password, cardNo, email, item, quantity, totalPrice);
    }

    public void cancel() {
        //user can cancel by exiting the browser in this assignment so I did not think this function was needed. 
        //If user quits from main page then they are redirected to a quit landing page
    }
}
