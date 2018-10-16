# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Simulates a real world situation of inheriting an existing code base in a language/framework that you are not comfortable/familiar with.

## Screenshots
![App Screenshot 1](https://github.com/aaronjparsons/jungle-rails/blob/master/docs/ss1.png)
![App Screenshot 2](https://github.com/aaronjparsons/jungle-rails/blob/master/docs/ss2.png)
![App Screenshot 3](https://github.com/aaronjparsons/jungle-rails/blob/master/docs/gif1.gif)

## Contributions to Project
* #### Feature - Product Sold Out
  * Sold out badge on product panel
  * Disabled add to cart button if sold out
* #### Feature - Admin Category Routes & Creation
  * Added ability for admin to create new categories
  * Added list of currently existing categories
* #### Feature - User Authentication
  * Added user table to database
  * Implemented user registration & login 
* #### Feature - Order Details Upon Checkout
  * After successful order, user is now shown a page displaying detailed order info
* #### Feature - Receipts Delivered via Email
  * User receives an email receipt after successful order
* #### Feature - Admin Authentication
  * Implemented admin authentication to be able to access admin area
* #### Feature - Product Ratings & Reviews
  * Added product reviews on product pages
  * Users are able to add reviews when they are logged in
  * Users are able to delete their own reviews
* #### Feature - Heroku deployment
  * Deployed the web app onto Heroku
  * https://radiant-lake-87083.herokuapp.com/
* #### Bug Fix - Checking out With Empty Cart
  * User now no longer sees the checkout button when cart is empty
  * Instead a message is shown telling them that their cart is currently empty
* #### Testing - Implemented Feature Tests with Capybara
  * Test that user sees products on the homepage
  * Test that a user can navigate to a product details page
  * Test that a user can add a product to their cart
  * Test that a user can succesfully login


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
