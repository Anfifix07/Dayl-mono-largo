const names = document.querySelector(".names")
const email = document.querySelector(".email")
const joined = document.querySelector(".joined")
const navBar = document.querySelector("nav")
const navToggle = document.querySelector(".navToggle")
const navLinks = document.querySelectorAll(".navList")
const darkToggle = document.querySelector(".darkToggle")
const body = document.querySelector("body")


navToggle.addEventListener('click', () => {
    navBar.classList.toggle('close');
    const logoImage = document.querySelector('.menu-logo');
    logoImage.classList.toggle('menu-logo-small');
})

navLinks.forEach(function (element) {
    element.addEventListener('click', function () {
        navLinks.forEach((e) => {
            e.classList.remove('active')
            this.classList.add('active')
        })
    })
})

    
function mostrarFormulario(formularioId) {
    // Oculta todos los formularios
    const formularios = document.querySelectorAll(".form-container");
    formularios.forEach((formulario) => {
        formulario.style.display = "none";
    });

    // Muestra el formulario correspondiente
    const formularioMostrar = document.getElementById(formularioId);
    if (formularioMostrar) {
        formularioMostrar.style.display = "block";
    } else {
        console.error("Formulario no encontrado:", formularioId);
    }
}
$(document).ready(function() {
    $('.pencil.alternate.icon').click(function() {
        var id_subcategoria = $(this).closest('.subcategoria_tabla').attr('data-subcategoria-id');
        editarProducto(id_subcategoria);
    });
});
function editarProducto(id_subcategoria){
    $.ajax({
        url: '/admin/subcategoria/edit/',
        type: 'GET',
        data: {
            subcategoria_id: id_subcategoria
        },
        success: function(data) {
            var subcategoriaJSON = data.subcategoria;
            var subcategoria = JSON.parse(subcategoriaJSON)[0].fields;
            document.getElementById('contenedor_subcategoria').setAttribute('style', 'display: none')
            document.getElementById('boton_registro_producto').setAttribute('style', 'display: none');
            var formulario = document.getElementById('producto-form');
            formulario.setAttribute('style', 'display: block;');
            formulario.querySelector('.ui.form').setAttribute('action', '/admin/subcategoria/edit/'+data.id_subcategoria)
            formulario.querySelector('[name="nombre"]').value = subcategoria.nombre;
            formulario.querySelector('[name="categoria"]').value = subcategoria.categoria;
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}
document.getElementById('registro_producto').addEventListener('click',function(){
    document.getElementById('contenedor_subcategoria').setAttribute('style', 'display: none');
    document.getElementById('boton_registro_producto').setAttribute('style', 'display: none');
    var formulario = document.getElementById('producto-form');
    formulario.setAttribute('style', 'display: block;');
});