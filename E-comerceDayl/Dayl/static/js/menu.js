document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelector('.hamburger').addEventListener('click', function() {
        var menu = document.querySelector('.menu-container');
        if (menu.style.display === "none") {
            menu.style.display = "block";
        } else {
            menu.style.display = "none";
        }
    });
});
