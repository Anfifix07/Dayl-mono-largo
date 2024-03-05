const getOptionChart = async () => {
    try{
        const response = await fetch("http://127.0.0.1:8000/admin/get_chart/");
        return await response.json();
    }catch (ex){
        alert(ex);
    }
};

const initChart = async () => {
    
    
    let chartDom = document.getElementById('chart')
    const myChart=echarts.init(chartDom);
    myChart.setOption(await getOptionChart());
    myChart.resize();
};

window.addEventListener("load", async () =>{
    await initChart();
    setInterval(async () =>{
        await initChart();
    },20000000);
});


option = {
    title: {
      text: 'valgo verga',
      subtext: ''
    },
    tooltip: {
      trigger: 'axis'
    },
    legend: {
      data: ['Cantidad', 'Total $']
    },
    toolbox: {
      show: true,
      feature: {
        dataView: { show: true, readOnly: false },
        magicType: { show: true, type: ['line', 'bar', 'pie'] },
        restore: { show: true },
        saveAsImage: { show: true }
      }
    },
    calculable: true,
    xAxis: [
      {
        type: 'category',
        data: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4']
      }
    ],
    yAxis: [
      {
        type: 'value'
      }
    ],
    series: [
      {
        name: 'Rainfall',
        type: 'bar',
        data: [
          2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
        ],
        markPoint: {
          data: [
            { type: 'max', name: 'Max' },
            { type: 'min', name: 'Min' }
          ]
        },
        markLine: {
          data: [{ type: 'average', name: 'Avg' }]
        }
      },
      {
        name: 'Evaporation',
        type: 'bar',
        data: [
          2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
        ],
        markPoint: {
          data: [
            { name: 'Max', value: 182.2, xAxis: 7, yAxis: 183 },
            { name: 'Min', value: 2.3, xAxis: 11, yAxis: 3 }
          ]
        },
        markLine: {
          data: [{ type: 'average', name: 'Avg' }]
        }
      }
    ]
  };

  function enviarPeticion(idProducto) {
    const url = '/admin/graficaxproducto/';
    const data = {
        id_producto: idProducto,
    };
  
    $.ajax({
        url: url,
        type: 'GET',
        data: data,
        success: function(response) {
            // Agregar el HTML del gráfico al contenedor
            
            $('#graph-container').html(response);
        
            // Reconfigurar cualquier interactividad del gráfico si es necesario
            // Por ejemplo, si quieres ajustar el tamaño del gráfico después de cargarlo:
            Plotly.relayout('graph-container', {
                width: $('#graph-container').width(),
                height: $('#graph-container').height()
            });
        },
        error: function(xhr, status, error) {
            console.log(error);
        }
    });
}

let categoryContent; // Definir categoryContent como variable global

$(document).ready(function() {
  $('#producto-input').on('input', function() {
      var searchTerm = $(this).val();

      // Realizar la solicitud AJAX solo si la longitud del término de búsqueda es mayor que 3
      if (searchTerm.length > 3) {
          $.ajax({
              url: '/admin/API/producto_categoria/',
              type: 'GET',
              data: {
                  'searchTerm': searchTerm
              },
              success: function(response) {
                  var productos = JSON.parse(response);
                  mostrarProductos(productos);
              },
              error: function(xhr, status, error) {
                  console.error('Error en la solicitud AJAX:', error);
              }
          });
      } else {
          // Si el término de búsqueda tiene menos de 3 caracteres, ocultar o borrar el div
          $('#producto-lista').empty(); // Borrar el div de productos
      }
  });

  function mostrarProductos(productos) {
      $('#producto-lista').empty();

      if (productos.length > 0) {
          productos.forEach(function(producto) {
              var opcionProducto = $('<div class="opcion-producto" data-id="' + producto.id + '" data-nombre="' + producto.title + '" data-categoria="' + producto.category + '">' + producto.title + ' - ' + producto.category + '</div>');
              opcionProducto.click(function() {
                  var productoSeleccionado = $(this);
                  $('#producto-input').val(productoSeleccionado.data('nombre'));
                  enviarPeticion(producto.id)
                  $('#producto-lista').empty();
              });
              $('#producto-lista').append(opcionProducto);
          });
      } else {
          console.log('No se encontraron productos');
      }
  }
});