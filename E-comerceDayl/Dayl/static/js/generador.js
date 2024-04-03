function fetchDataWithDelay(i) {
  const url = `https://dummyjson.com/products/${i}`;
  setTimeout(() => {
    fetch(url)
      .then(res => res.json())
      .then(data => {
        console.log('Datos recibidos:', data)
        $.ajax({
          url: '/producto/generar/automatico',
          type: 'GET',
          contentType: 'application/json',
          data: {'datos':JSON.stringify(data)},
          success: function(data) {
            console.log('Respuesta recibida:', data);
          },
          error: function(xhr, status, error) {
            console.error('Error:', error);
          }});
        });
  }, i * 500);
}

// Realizar 150 solicitudes con retraso
function vamosNacio(){
  for (let i = 1; i <= 100; i++) {
    fetchDataWithDelay(i);
  }
}
