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

//java bean class just stores values of needed variables and has getters/setters to set and retrieve the values
public class OrderRequestBean {
  private String accountId;
  private String password;
  private String item;
  private String quantity;
  private String totalPrice;
  private String email;
  private String cardNumber;
  private String authorized; //Whether or not bank authorized credit card; 'yes' for yes, 'no' for no
  private int requestType; //Type 1 is request order, Type 2 is create account request order Type 3, is update credit card request order
  private String confirmation;
  
  public void setAccountId(String s){accountId = s;}
  public void setPassword(String s){password = s;}
  public void setItem(String s){item = s;}
  public void setQuantity(String s){quantity = s;}
    public void setTotalPrice(String s){totalPrice = s;}
  public void setEmail(String s){email = s;}
  public void setCardNumber(String s){cardNumber = s;}
  public void setAuthorized(String s){authorized = s;}
  public void setRequestType(int i){requestType = i;}
  public void setConfirmation(String s){confirmation = s;}
  
  public String getAccountId(){return accountId;}
  public String getPassword(){return password;}
  public String getItem(){return item;}
  public String getQuantity(){return quantity;}
  public String getTotalPrice(){return totalPrice;}
  public String getEmail(){return email;}
  public String getCardNumber(){return cardNumber;}
  public String getAuthorized(){return authorized;} 
  public int getRequestType(){return requestType;} 
  public String getConfirmation(){return confirmation;}
}
