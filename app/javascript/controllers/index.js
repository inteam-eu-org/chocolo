// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

let questions = []

window.initGame = function () {
  // Display loader
  $('#loader').show();
  // Query the questions for the game
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
        questions = data["questions"];
        startGame();
      } else {
        alert('An error occurred while trying to fetch the questions');
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
  // If ran out of questions, finish the game!
  if (questions.length === 0) {
    finishGame();
    return;
  }
  // Display the next question
  $('#question').text(questions.shift());
}

window.finishGame = function () {
  $('#game').hide();
  $('#end').css('display', 'block');
}