# Braintree Hosted Fields

This is a Braintree Hosted Fields integration example in Rails.

### Setup

1. Download or clone this Github repo

2. In your terminal, navigate to the root directory and type:
```
bundle install
```

3. In the root directory, create a new file called `.env`. Copy the contents
   of `example.env` into your new `.env` file. Insert your Braintree API
   credentials into `.env`. You can find your API credentials by following
   [these steps](https://articles.braintreepayments.com/control-panel/important-gateway-credentials#api-credentials).

4. Start the rails app:
```
rails s
```

5. When creating transaction, feel free to use the credit cards referenced in
   [this Braintree developer doc](https://developers.braintreepayments.com/reference/general/testing/ruby#no-credit-card-errors).
   You can use any future expiration date and any valid CVV.

### Built With

* [Rails](http://rubyonrails.org/) - The web framework used
* [Bootstrap](https://getbootstrap.com/) - HTML and CSS framework for styling
* [RuboCop](https://github.com/bbatsov/rubocop) - Ruby static code analyzer
* [Braintree](https://braintreepayments.com) - Payment functionality