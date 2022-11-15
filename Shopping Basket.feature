Feature: Shopping Basket
#As a customer I should be able to edit the contents of my shopping basket, change quantities and then checkout

Scenario: As a customer I can add an item to my shopping basket
Given I am on the product detail page
And the product is in stock
And this product is currently not in the basket
When I click the Add to Basket button
Then the product is added to the basket
But a message is displayed to the user
And the stock level is reduced by one

Scenario: As a user I should be able to login to my account using my credentials
Given the user is on the login page
And the signin button is displayed
When the user enters their username
And the user enters their password
And the user clicks the login button
Then the user is authenticated
And the user is on the account page


Given My shopping basket contains
* Product A
* Product B
* Product C
When I apply a discount code
Then the discount is valid

Scenario: As a customer I can create a new account
Given I am on the register screen
And I enter my username
And I enter my password
And I click the register button
Then I am sent to the account screen


# product is not in stock and not in the basket
Scenario: As a customer I am unable to add an item to my shopping basket if not in stock
Given I am on the product detail page
And the product is not in stock
And this product is currently not in the basket
When I click the Add to Basket button
Then a message is displayed to the user
And the product is not added to the basket
And the stock level is unchanged

# product is in stock and in the basket
Scenario: As a customer I am unable to add an item to my shopping basket if it's already in the basket
Given I am on the product detail page
And the product is in stock
And this product is currently in the basket
When I click the Add to Basket button
Then a message is displayed to the user
And the product is not added to the basket
And the stock level is unchanged

Scenario: As a customer I can remove an item from my shopping basket
Given I am on the basket page
When I click the remove button
Then the product is removed from the basket

Scenario: As a customer I can view the items of my shopping basket
Given I am on the home page
When I click the shopping basket icon
Then I see a list of shopping items

Scenario: As a customer I can checkout from the shopping basket
Given I am on the basket page
When I click the checkout button
Then I should be taken to the checkout page
