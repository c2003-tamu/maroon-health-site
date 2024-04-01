// app/assets/javascripts/navbar.js
function initializeNavbarToggle() {
  const navbarToggle = document.getElementById('navbar-toggle');
  const navbarLinks = document.getElementById('navbar-links');

  // Check if navbarToggle and navbarLinks are valid elements
  if (navbarToggle && navbarLinks) {
    // Use arrow function to avoid issues with 'this' context
    navbarToggle.addEventListener('click', () => {
      navbarLinks.classList.toggle('active');
    });
  } else {
    console.error('Navbar toggle or navbar links are not found.');
  }
}


// Call initializeNavbarToggle function when Turbolinks has loaded a new page
document.addEventListener('DOMContentLoaded', function() {
  initializeNavbarToggle();
});




