$(document).ready(function() {

   $('#my_sign_up_form').on('submit', function(event) {
     event.preventDefault();
     var info = $(this).serialize();

      $.ajax({
        type: 'POST',
        url: '/user',
        data: info

      }).done(function(response) {
        console.log(response);
      })
   })

   //    $('#payment-form').on('submit', function(event) {

   // })

   // function store(){
   //   var inputEmail= document.getElementById("email");
   //   localStorage.setItem("email", inputEmail.value);
   //  }



//  for credit card
$(function() {
  var $form = $('#payment-form');
  $form.submit(function(event) {
    console.log("you clicked credit")
    // Disable the submit button to prevent repeated clicks:
    event.preventDefault();
    $form.find('.submit').prop('disabled', true);
    // Request a token from Stripe:
    token = Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from being submitted:
    return false;
  });
});

//  for debit card
$(function() {
  var $form = $('#debit-payment-form');
  $form.submit(function(event) {
    console.log("you clicked debit")
    // Disable the submit button to prevent repeated clicks:
    event.preventDefault();
    $form.find('.submit').prop('disabled', true);
    // Request a token from Stripe:
    token = Stripe.card.createToken($form, stripeDebitResponseHandler);

    // Prevent the form from being submitted:
    return false;
  });
});

function stripeResponseHandler(status, response) {
  // Grab the form:
  var $form = $('#payment-form');

    if (response.error) { // Problem!
    console.log("wtf")
    // Show the errors on the form:
    $form.find('.payment-errors').text(response.error.message);
    $form.find('.submit').prop('disabled', false); // Re-enable submission

  } else { // Token was created!

    // Get the token ID:
    var token = response.id;
    console.log(token)

    data = {'token': token}
    // Insert the token ID into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripeToken">').val(token));

    // Submit the form:
    // $form.get(0).submit();

     var info = $(this).serialize();

      $.ajax({
        type: 'POST',
        url: '/card',
        data: data

      }).done(function(response) {
        console.log(response);
      })



  }
};

function stripeDebitResponseHandler(status, response) {
  // Grab the form:
  var $form = $('#debit-payment-form');

    if (response.error) { // Problem!
    console.log("wtf")
    // Show the errors on the form:
    $form.find('.payment-errors').text(response.error.message);
    $form.find('.submit').prop('disabled', false); // Re-enable submission

  } else { // Token was created!

    // Get the token ID:
    var token = response.id;
    console.log(token)

    data = {'token': token}
    // Insert the token ID into the form so it gets submitted to the server:
    // $form.append($('<input type="hidden" name="stripeToken">').val(token));

    // Submit the form:
    // $form.get(0).submit();

      $.ajax({
        type: 'POST',
        url: '/debit',
        data: data

      }).done(function(response) {
        console.log(response);
      })



  }
};

})
