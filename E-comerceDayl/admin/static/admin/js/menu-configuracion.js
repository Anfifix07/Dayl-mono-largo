logo = document.getElementById('logo')

window.addEventListener('resize', function (event) {
  if (this.screen.width < 1600) {
    console.log('change')
  }
}, true);



//funcion de ocultar el menu


document.addEventListener('DOMContentLoaded', function () {
  var iconoIzquierdo = document.getElementById('icon-izquierdo');
  var menuIzquierdo = document.querySelector('.menu-izq');
  var inputCentro = document.getElementById('input-centro');

  iconoIzquierdo.addEventListener('click', function () {
    menuIzquierdo.classList.toggle('menu-visible');
    inputCentro.classList.toggle('ocultar1');

    // Si el menú izquierdo está visible, ocultar la barra de búsqueda
    if (menuIzquierdo.classList.contains('menu-visible')) {
      inputCentro.classList.add('ocultar1');
    }
  });

  window.addEventListener('resize', function () {
    if (window.innerWidth > 400) {
      inputCentro.classList.remove('ocultar1');
    } else {

    }
  });
});

//Funcion de regreso a home
logo.addEventListener('click', function () {
  window.location.href = '/';
})

function search_filters() {
  var menus = document.querySelectorAll('.ui.simple.dropdown.item .menu');
  var menuInput = document.querySelectorAll('.ui.action.input.menu')
  var filtroInput = menuInput[0].querySelector('input[type="text"]').value
  var filtro = menus[0];
  var checkboxes = filtro.querySelectorAll('input[type="checkbox"]');

  var filtros = []
  checkboxes.forEach(function(checkbox) {
    if(checkbox.checked == true){
      filtros.push(checkbox.value)
    }
    
});
if (filtros == []){
  filtros = "";
}
console.log(filtros)
  $.ajax({
    url: '/admin/',
    type: 'GET',
    data: {
      filtros: JSON.stringify(filtros),
      busqueda: filtroInput
    },
    success: function (data) {
      window.location.href = "/admin/busqueda";
    },
    error: function (error) {
      console.error('Error:', error);
    }
  });
}
