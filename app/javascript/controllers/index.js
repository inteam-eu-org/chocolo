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
  // Gather the players names
  let players = $('#form-grid > input.grid-item').map(function () {
    return $(this).val()
  }).get().filter((word) => word.length > 0);
  // Query the events for the game
  const theme_id = $('#theme-select').find(":selected").val();
  $.ajax({
    url: '/themes/' + theme_id,
    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    data: { players: players },
    dataType: "json",
    type: 'POST',
    success: function (data) {
      $('#loader').hide();
      if (data["status"] === "error") {
        alert(data["message"]);
      } else if (data["status"] === "success") {
        events = data["events"];
        startGame();
      } else {
        alert(data["message"]);
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
  $('#theme').hide();
  $('#form').hide();
  $('#start').hide();
  // Shows the game
  $('#game').css('display', 'block');
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
  $('#game').hide();
  $('#end').css('display', 'block');
}