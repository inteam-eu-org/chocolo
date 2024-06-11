import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

document.addEventListener('DOMContentLoaded', () => {
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/service-worker.js')
      .then(registration => {
        console.log('ServiceWorker registration successful with scope: ', registration.scope);
      }, err => {
        console.log('ServiceWorker registration failed: ', err);
      });
  }

  let deferredPrompt;

  window.addEventListener('beforeinstallprompt', (event) => {
    // Prevent the browser's default install prompt
    event.preventDefault();
    // Stash the event so it can be triggered later
    deferredPrompt = event;
    // Show the Bootstrap modal
    $('#installModal').modal('show');
  });

  // Handle the install button click event
  document.getElementById('installButton').addEventListener('click', () => {
    // Trigger the install prompt
    deferredPrompt.prompt();
    // Wait for the user to respond to the prompt
    deferredPrompt.userChoice.then((choiceResult) => {
      if (choiceResult.outcome === 'accepted') {
        console.log('User accepted the install prompt');
      } else {
        console.log('User dismissed the install prompt');
      }
      // Reset the deferredPrompt variable
      deferredPrompt = null;
      // Close the Bootstrap modal
      $('#installModal').modal('hide');
    });
  });
});

export { application }
