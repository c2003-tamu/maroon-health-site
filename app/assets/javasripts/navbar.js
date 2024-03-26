// app/assets/javascripts/navbar.js
document.addEventListener('DOMContentLoaded', function() {
  const navbarToggle = document.getElementById('navbar-toggle');
  const navbarLinks = document.getElementById('navbar-links');

  navbarToggle.addEventListener('click', function() {
    navbarLinks.classList.toggle('active');
  });
});






