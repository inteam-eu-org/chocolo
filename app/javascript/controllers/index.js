// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

let events = []

window.initGame = function () {
  // Display loader
  $('#loader').show();
  // Query the events for the game
  const theme_id = $('#theme-select').find(":selected").val();
  $.ajax({
    url: '/themes/' + theme_id,
    dataType: "json",
    type: 'GET',
    success: function (data) {
      $('#loader').hide();
      if (data["status"] === "error") {
        alert(data["message"]);
      } else if (data["status"] === "success") {
        events = data["events"];
        startGame();
      } else {
        alert('An error occurred while trying to fetch the events');
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      $('#loader').hide();
      alert(textStatus + "\nError: " + errorThrown);
    }
  });
}

window.startGame = function () {
  // Hide the UI
  $('#setup-container').css('display', 'none');
  // Shows the game
  $('#game-container').css('display', 'flex');
  $('#game').css('display', 'flex');
  updateGame();
}

window.updateGame = function () {
  // If ran out of events, finish the game!
  if (events.length === 0) {
    finishGame();
    return;
  }
  // Display the next event
  $('#event').text(events.shift());
}

window.finishGame = function () {
  $('#game').css('display', 'none');
  $('#end').css('display', 'flex');
}