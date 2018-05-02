$(document).ready(function() {
  var form = document.querySelector('#payment-form');
  var submit = document.querySelector('input[type="submit"]');

  braintree.client.create({
    authorization: 'sandbox_7tydyn8p_235zhthv55dqtgks'
  }, function (clientErr, clientInstance) {
    if (clientErr) {
      console.error(clientErr);
      return;
    }

    // This example shows Hosted Fields, but you can also use this
    // client instance to create additional components here, such as
    // PayPal or Data Collector.

    braintree.hostedFields.create({
      client: clientInstance,
      styles: {
        'input': {
          'font-size': '14px'
        },
        'input.invalid': {
          'color': 'red'
        },
        'input.valid': {
          'color': 'green'
        }
      },
      fields: {
        number: {
          selector: '#card-number',
          placeholder: '4111 1111 1111 1111'
        },
        cvv: {
          selector: '#cvv',
          placeholder: '123'
        },
        expirationDate: {
          selector: '#expiration-date',
          placeholder: '02/20'
        }
      }
    }, function (hostedFieldsErr, hostedFieldsInstance) {
      if (hostedFieldsErr) {
        console.error(hostedFieldsErr);
        return;
      }

      submit.removeAttribute('disabled');

      form.addEventListener('submit', function (event) {
        event.preventDefault();

        hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
          if (tokenizeErr) {
            console.error(tokenizeErr);
            return;
          }

          // If this was a real integration, this is where you would
          // send the nonce to your server.
          console.log('Got a nonce: ' + payload.nonce);
        });
      }, false);
    });
  });
});