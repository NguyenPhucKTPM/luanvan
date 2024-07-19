document.addEventListener("DOMContentLoaded", function() {
    var searchToggle = document.querySelector('.search-toggle');
    var searchBar = document.getElementById('search-bar');

    searchToggle.addEventListener('click', function(e) {
        e.preventDefault();
        searchBar.classList.toggle('active');
    });
});