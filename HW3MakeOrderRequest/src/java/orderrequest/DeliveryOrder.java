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
public class DeliveryOrder {
    private String accountId;
    private String item;
    private int quantity;
    private int totalPrice;
    private int authorizationNumber;
    private String confirmation;
    
    public String createOrder(String accId, String itemType, int quant, int totPrice, int authorizationNo){
        accountId = accId;
        item = itemType;
        quantity = quant;
        totalPrice = totPrice;
        authorizationNumber = authorizationNo;
        
        confirmation = "Account Id: " + accountId + "<br>" +
                        "Item: " + item + "<br>" +
                        "Quantity: " + quantity + "<br>" +
                        "TotalPrice: " + totalPrice + "<br>" +
                        "Authorization Number: " + authorizationNumber + "<br>";
        
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/make_order_request","root","admin");
            Statement mystmt = con.createStatement();
            
            
            ResultSet rs = mystmt.executeQuery("SELECT * FROM delivery_order WHERE account_id = '"+ accountId + "'");
            while(rs.next()){
                //System.out.println(rs.getString("account_id"));
               //return rs.getString("item");
      
           if(rs.getString("account_id") != null){
                
           
            String query = "UPDATE delivery_order SET item = ?, quantity = ?, total_price = ?, authorization_no = ? WHERE account_id ='" + accountId +"'";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, item);
            ps.setInt(2, quantity);
            ps.setInt(3, totalPrice);
            ps.setInt(4, authorizationNumber);
          
            
            ps.executeUpdate();
            return confirmation;
            }
            }
            
            String query = "INSERT INTO delivery_order(account_id, item, quantity, total_price, authorization_no) VALUES (?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accountId);
            ps.setString(2, item);
            ps.setInt(3, quantity);
            ps.setInt(4, totalPrice);
            ps.setInt(5, authorizationNumber);
            
            ps.executeUpdate();
             
      
    }
        
        catch(Exception e){
        e.printStackTrace();
           
       return "connection to database failed";
        }
        
        
        
        return confirmation;
        
    }
}
