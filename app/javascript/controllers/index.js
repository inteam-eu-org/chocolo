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
  let players = $('#form-grid input.form-control').map(function () {
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
  $('#setup-container').css('display', 'none');
  $('#title').hide();

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
  $('#title').show();
  $('#end').css('display', 'flex');
  var audio = new Audio('https://actions.google.com/sounds/v1/human_voices/human_fart.ogg');
  audio.play();
}


window.addPlayerSlot = function () {
  const inputGroup = document.getElementById('form-grid');
  const inputs = inputGroup.querySelectorAll('.form-control');

  // Check if any input is empty
  for (let i = 0; i < inputs.length; i++) {
    if (inputs[i].value.trim() === '') {
      // If any input is empty, do not add a new one
      alert("Ya déjà un champs vide débilos");
      return;
    }
  }

  // Check if any input is empty
  for (let i = 0; i < inputs.length; i++) {
    if (inputs[i].value.trim() === '') {
      // If any input is empty, do not add a new one
      alert("Ya déjà un champs vide débilos");
      return;
    }
  }

  // If all inputs are filled, add a new one
  const newCol = document.createElement('div');
  newCol.className = 'col position-relative';

  const inputWrapper = document.createElement('div');
  inputWrapper.className = 'position-relative';

  const newInput = document.createElement('input');
  newInput.type = 'text';
  newInput.className = 'form-control pr-4';
  inputWrapper.appendChild(newInput);

  // Create the close button
  const closeButton = document.createElement('button');
  closeButton.type = 'button';
  closeButton.className = 'btn-close btn-remove-player';
  closeButton.setAttribute('aria-label', 'Close');
  closeButton.setAttribute('onclick', 'removePlayerSlot(this)');
  inputWrapper.appendChild(closeButton);

  newCol.appendChild(inputWrapper);

  // Insert the new input before the first child of the inputGroup
  inputGroup.insertBefore(newCol, inputGroup.firstChild);
}

window.removePlayerSlot = function (button) {
  const col = button.closest('.col');
  col.remove();
}