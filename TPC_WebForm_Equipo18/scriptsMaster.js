document.addEventListener('DOMContentLoaded', function () {
    var dropdownToggle = document.getElementById('navbarDropdownMenuLink');
    var dropdownMenu = dropdownToggle.nextElementSibling;

    dropdownToggle.addEventListener('click', function (e) {
        e.preventDefault();
        dropdownMenu.classList.toggle('show');
    });

    var dropdownSubmenus = document.querySelectorAll('.dropdown-submenu .dropdown-toggle');
    dropdownSubmenus.forEach(function (submenu) {
        submenu.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            // Cerrar todos los submenús abiertos
            var openSubmenus = document.querySelectorAll('.dropdown-submenu .dropdown-menu.show');
            openSubmenus.forEach(function (openSubmenu) {
                if (openSubmenu !== submenu.nextElementSibling) {
                    openSubmenu.classList.remove('show');
                }
            });
            // Alternar el submenú actual
            submenu.nextElementSibling.classList.toggle('show');
        });
    });

    // Cerrar menús y submenús cuando se hace clic fuera
    document.addEventListener('click', function (e) {
        if (!dropdownToggle.contains(e.target) && !dropdownMenu.contains(e.target)) {
            dropdownMenu.classList.remove('show');
        }

        if (!e.target.closest('.dropdown-submenu')) {
            var openSubmenus = document.querySelectorAll('.dropdown-submenu .dropdown-menu.show');
            openSubmenus.forEach(function (openSubmenu) {
                openSubmenu.classList.remove('show');
            });
        }
    });
});

