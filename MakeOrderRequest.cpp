#include <iostream>
#include <vector>
#include <stdlib.h>

using namespace std;

//Global variable to create AccountIDs
int id = 1;


//CustomerInterface class <<interface>>
class CustomerInterface {
public:
  int AccountID;
  string CustomerEmail;
  void request(); //fuction that submits an order request
  void createAccRequestOrder();
  void requestOrderWithNewCardNo();
  void cancel(); //function that cancels current request


};

//BankInterface class <<interface>>
class BankInterface {
public:
  void authorize(); //function that checks if customer credit card is valid

};

//EmailServerInterface class <<interface>>
class EmailServerInterface{
public:
  void emailConfirmation(); //function that displays an email confirmation

};


//CustomerAccount class <<entity>>
//Inherits from CustomerInterface class
class CustomerAccount: public CustomerInterface {
public:
  //AccountID is inherited from CustomerInterface class
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
  "Please select an item from our catalog to add to your cart:\n"
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

  return;
}

CustomerAccount createCustomerAccount(){ //function that creates a new account
  CustomerAccount customer; //create new instance of CustomerAccount object
  customer.CreateAccount(); //call object's CreateAccount function to get user information
  return customer; //return new CustomerAccount object
}


int main(){
  int selectedOption = 1; //variable that stores user input
//because we are not implementing a database for this assignment
//i will store customer accounts and information using vectors
  vector<CustomerAccount> accounts;
  int customerCart[3] = {0,0,0}; //cart that stores items that the customer has selected
  //index 0 holds the number of red backpacks, 1 white backpacks and 2 black
  int *ptr = customerCart; //create pointer that points to customerCart

  PurchaseOrderManager orderManager;

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
