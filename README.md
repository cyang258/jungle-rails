# Jungle

A mini e-commerce application built with Rails 4.2, PostgreSQL, and use the Stripe deal with credit card payments.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Sign up for a Stripe account
5. Put Stripe (test) keys into appropriate .env vars
6. Put username and password for admin into appropriate .env vars
7. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Final Product
!["Screenshot of Admin_control_page"](https://github.com/cyang258/jungle-rails/blob/master/docs/Admin_control_page.png)
!["Screenshot of Checkout_page"](https://github.com/cyang258/jungle-rails/blob/master/docs/Checkout_page.png)
!["Screenshot of Jungle_home_page"](https://github.com/cyang258/jungle-rails/blob/master/docs/Jungle_home_page.png)
!["Screenshot of Order_comfirmation"](https://github.com/cyang258/jungle-rails/blob/master/docs/Order_comfirmation.png)
!["Screenshot of Product_sorted_by_categories"](https://github.com/cyang258/jungle-rails/blob/master/docs/Product_sorted_by_categories.png)


