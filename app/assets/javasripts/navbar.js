// app/assets/javascripts/navbar.js
function initializeNavbarToggle() {
  const navbarToggle = document.getElementById('navbar-toggle');
  const navbarLinks = document.getElementById('navbar-links');

  navbarToggle.addEventListener('click', function() {
    navbarLinks.classList.toggle('active');
  });
}

document.addEventListener('DOMContentLoaded', function() {
  initializeNavbarToggle();
});

document.addEventListener('turbolinks:load', function() {
  initializeNavbarToggle();
});




