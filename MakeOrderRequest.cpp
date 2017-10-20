#include <iostream>
#include <vector>
#include <stdlib.h>

using namespace std;

/* Note: I created these classes and functions based on the assignment requirements*/


//Global variable to create AccountIDs
int id = 1;


//CustomerAccount class <<entity>>
//Inherits from CustomerInterface class
class CustomerAccount {
public:
  //AccountID is inherited from CustomerInterface class
  int AccountID;
  string CustomerEmail;
  int CardNo; //customer's credit card number
  //email is inherited from CustomerInterface

  void ReadAccountInfo(){ //function that displays customer information
    cout <<
      "***CUSTOMER***\n"
      "Account Id Number: " << AccountID << " " << endl <<
      "Email Address: " <<CustomerEmail << " " << endl <<
      "Credit Card Number: " << CardNo << endl;

  };
  void CreateAccount(){//function that creates a new account

    cout << "***CUSTOMER***\n"; //indicates that this is done by customer actor
    AccountID = id; //generate new id from global variable
    id += id; //increment id variable for next user
    cout << "Please enter your email address:\n"; //get email address from customer
    cin >> CustomerEmail;
    cout << "Please enter your credit card number:\n"; //get credit card number from customer
    cin >> CardNo;

  };
  void UpdateCardNo(){ //function that updates a users credit card
    cout <<
    "***CUSTOMER***\n"
    "Please enter a new credit card number: ";
    cin >> CardNo;
  };
};
//CustomerInterface class <<interface>>
class CustomerInterface {
public:
  int AccountID;
  string CustomerEmail;
  CustomerAccount account;
  void request(){ //fuction that submits an order request
    cout << "Your order has been sumbitted. \n";

  };
  void createAccRequestOrder();
  void requestOrderWithNewCardNo();
  void cancel(); //function that cancels current request


};

//BankInterface class <<interface>>
class BankInterface {
public:
  bool authorize(int cardNo) //function that checks if customer credit card is valid
  {
    int bankerInput;
    cout <<"***BANK***\n" //You are acting as a bank actor in this function so BANK title is used
      "The credit card number of the customer is: " <<
      cardNo << ". " << "Do you wish to authorize this transaction?\n"
      "Enter 1 for yes or any other character for no.\n";

      cin >> bankerInput; //decide whether or not to authorize credit card

      if (bankerInput == 1){
        return true;
      } else {
        return false;
      }


  }
};

//EmailServerInterface class <<interface>>
class EmailServerInterface{
public:
  void emailConfirmation(string email){ //function that displays an email confirmation
    cout << "Thank you for placing an order with Online Raider Backpacks! \nA confirmation email"
      "has been sent to " << email <<" . We will now return you to the main menu.\n ";
  };
};



//DeliveryOrder class <<entity>>
class DeliveryOrder {
public:
  int AccountID; //Account number of customer who requested the order
  int OrderContents; //Items that customer wishes to order
  int AuthorizationNo; //Authorization number recieved from bank

  void createOrder(); //function that creates a new order

};

//PurchaseOrderManager class <<business logic>>
//inherits from customer interface class
class PurchaseOrderManager : public CustomerInterface {
public:
    //AccountID is inherited from CustomerInterface class
   //Email of customer is inherited from CustomerInterface


};



void errorMessage() { //This function displays error message if user enters a number that is not listed

	cout << "The number you have entered is invalid." << endl; //Error message
}

void catalogMenu(int *ptr){
  int selectedOption; //Variable that stores user input

  //display catalog
  cout <<
  "***CUSTOMER***\n" //Indicates this is customer user interface
  "Please select an item from our catalog to add to your cart (all backpacks are $25):\n"
  "1. Red Backpack\n"
  "2. White Backpack\n"
  "3. Black Backpack\n"
  "4. Return to main menu\n";

  cin >> selectedOption; //get input from user

	if (selectedOption >= 1 && selectedOption <= 4) { //verify user selected valid option

		switch (selectedOption) {
		case 1:
      ptr[0] += 1; //add one red backpack to customerCart
			cout << "One Red backpack has been added to your cart. ";
			break;
		case 2:
      ptr[1] += 1; //add one white backpack to customerCart
			cout << "One White backpack has been added to your cart. ";
			break;
		case 3:
      ptr[2] += 1; //add one black backpack to customerCart
			cout << "One Black backpack has been added to your cart. ";
			break;
		case 4:
			return;
			break;
		default:
			break;

		}
  }
		cout << "Would you like to add another backpack?\n"
		"Enter 1 for Yes or any other character to return to the main menu.\n";

		cin >> selectedOption;

		if (selectedOption == 1) {
			catalogMenu(ptr);
		} else {


    }

}

//function that displays home menu options to customer
int displayMenu(){
  int selectedOption; //Variable that stores user input

  //print out menu options
  cout <<
    "***CUSTOMER***\n" //Title that shows that this user interface is for customer actor
    "Welcome to Raider Backpacks's Online store! Please select a menu option:\n"
    "1. Browse catalog\n"
    "2. Create an account\n"
    "3. View account information\n"
    "4. Submit an order request\n"
    "5. Quit\n";

    cin >> selectedOption; //Get user input

    if (selectedOption > 0 && selectedOption <= 5){ //if user enters a valid menu option
      return selectedOption; //return selectedOption
    } else{ //if user entered non valid number for menu option
      errorMessage(); //display error message
      displayMenu(); //return to menu
    }

}

void viewAccountInfo(vector<CustomerAccount> accountArray){ //takes list of all accounts as a parameter
  int id; //customer's account ID number variable
  string placeHolder;
  cout <<"please enter your Account ID number:\n";
  cin >> id;
  for(int i = 0; i < accountArray.size(); i++){ //search account vector for object with id that matches that entered by the user
    if (accountArray[i].AccountID == id){
        accountArray[i].ReadAccountInfo(); //call member function ReadAccountInfo to display the information
        cout << "Enter any character to continue.\n";
        cin >> placeHolder;
        return;
    }

  }
  cout <<"The Acount ID that you entered does not exist.\n";
  return;
}

CustomerAccount createCustomerAccount(){ //function that creates a new account
  CustomerAccount customer; //create new instance of CustomerAccount object
  customer.CreateAccount(); //call object's CreateAccount function to get user information
  return customer; //return new CustomerAccount object
}



bool cartIsEmpty(int *cart){ //function that checks to see if your cart is empty

  for (int i = 0; i < 3; i++){
    if (cart[i] != 0){
      return false; //if cart is not empty return false
    }

  }
  return true; //if cart is empty return true

}




//function that submits an order request
void submitOrderRequest(int *cart, vector<CustomerAccount>* accountArray){
  PurchaseOrderManager orderManager; //create instance of PurchaseOrderManager
  BankInterface bank; //bank object
  int totalPrice = (cart[0]+cart[1]+cart[2])*25;
  bool accountExists = false; //verification for whether or not an account exists
  CustomerAccount customer;
  int selectedOption, id; //variables that reciev input from customer
  int currentIdIndex = 0; //variable to store index of current customer
  EmailServerInterface emailServer;
  //check to see if cart is empty. If empty, return to main menu and instruct customer to select item from catalog
  if (cartIsEmpty(cart) == true){
    cout << "Your cart appears to be empty.\n Please go to the catalog and add items to"
      " your cart before submitting an order request.\n";
      return;
  }

  cout << "***CUSTOMER***\n" //get Account ID from user
    "Please enter your account ID:\n";
    cin >> id;


    //check if account exists
    for (int i = 0; i < (*accountArray).size(); i++){
      if ((*accountArray)[i].AccountID == id){
        accountExists = true;
        customer = (*accountArray)[i];
        currentIdIndex = i; //store index in accountArray of customer so we can update credit card if needed
      }
    }
    if (accountExists == false){ //if ID is not found then return to main menu
      cout << "The Account ID you have entered cannot be found."
        "Please return to the main menu and create an account.\n";
        return;
    }

    while(bank.authorize(customer.CardNo) == false){ //If bank did not authorize credit card
      cout << "***CUSTOMER***\n" //Ask customer to update credit card information or return to main menu
        "Your credit card has been denied. Press 1 to update your credit"
        "card information or any other character to quit.\n";

      cin >> selectedOption; //get input from customer
      if (selectedOption == 1){
        customer.UpdateCardNo(); //call member function that updates credit card
        (*accountArray)[currentIdIndex] = customer; //replace old customer with customer with updated credit card
      } else{ return;};

    }

    cout << "You are placing an order of " << cart[0] << " red backpack(s), " << cart[1] <<
    " white backpack(s), and " << cart[2] << " backpack(s) "
      "for a total of $" << totalPrice <<". Do you wish to"
      "continue? (Enter 1 for yes and any other character for no.)\n";
      cin >> selectedOption;
      if (selectedOption != 1){
        return;
      }

    orderManager.request();
    emailServer.emailConfirmation(customer.CustomerEmail);
    return;
}



int main(){
  int selectedOption = 1; //variable that stores user input
//because we are not implementing a database for this assignment
//i will store customer accounts and information using vectors
  vector<CustomerAccount> accounts;
  int customerCart[3] = {0,0,0}; //cart that stores items that the customer has selected
  //index 0 holds the number of red backpacks, 1 white backpacks and 2 black
  int *ptr = customerCart; //create pointer that points to customerCart

  vector<CustomerAccount> *vecptr;
  vecptr = &accounts;

  PurchaseOrderManager orderManager; //create PurchaseOrderManager object

  while (selectedOption != 5){

    selectedOption = displayMenu(); //display menu and get user input

    switch(selectedOption){
      case 1:
        catalogMenu(ptr); //opens catalog user interface
        break;
      case 2:
        //calls createCustomerAccount function and stores new CustomerAccount object in accounts
        accounts.push_back(createCustomerAccount());


        break;
      case 3:
        viewAccountInfo(accounts);
        break;
      case 4:
        submitOrderRequest(ptr, vecptr);


        break;
      case 5: //exit the program
        cout << "Thank you for visiting Raider Backpack's Online store. Please come again!\n";
        break;
      default:
        errorMessage();
        break;
    }

  }

  return 0;
}
