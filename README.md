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

5. The app should be available on `localhost:3000`

### Testing

When creating transaction, feel free to use the credit cards referenced in
[this Braintree developer doc](https://developers.braintreepayments.com/reference/general/testing/ruby#no-credit-card-errors).
You can use any future expiration date and any valid CVV. I've included a
Postal Code field for card verification through AVS. You can change your AVS
rules to check for gateway rejections. The card number, expiration, CVV, and
postal code fields are all Hosted Fields. Cardholder name is tokenized with 
them in the nonce.

### Built With

* [Rails v4.2.10](http://rubyonrails.org/) - The web framework used
* [Bootstrap v3.3.7](https://getbootstrap.com/) - HTML and CSS framework for styling
* [Braintree](https://braintreepayments.com) - Payment functionality