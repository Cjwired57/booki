$(document).ready(function() {

 $('body').on('submit','#my_sign_up_form', function(event) {
   event.preventDefault();
   var info = $(this).serialize();
   debugger;
   $.ajax({
    type: 'POST',
    url: '/user',
    data: info

  }).done(function(response) {
    console.log(response);
  })
})

//  $('body').on('submit','#debit-payment-form', function(event) {
//    event.preventDefault();
//    var info = $(this).serialize();
//    debugger;
//    $.ajax({
//     type: 'POST',
//     url: '/user',
//     data: info

//   }).done(function(response) {
//     console.log(response);
//   })
// })

 $('#pick-home-team-button').on('click', function(event) {
  event.preventDefault();

      // var homeTeamID = form hidden inputs
      // var awayTeamID = same as above or something
      // var gameID = the game's id
      // var betAmount = get the bet amount.
      // var userChoice = 'home' or 'away'
      // var opponentEmail = get the email of the opponent? maybe a user should have a username. spitballing, but we should figure out how to send an actual request

        var data = {
          'home_team_id': homeTeamID,
          'away_team_id': awayTeamID,
          'user_choice': userChoice,
          'game_id': gameID,
          'opponentEmail': opponentEmail,
          'bet_amount': betAmount
      }

      $.ajax({
        method: 'POST',
        url: '/request',
        data: data
      }).done(function(response){
        console.log(response)

      })





    })
 $('#pick-away-team-button').on('click', function(event) {
  event.preventDefault();






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
