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
          var responseData = JSON.parse(response);
          var layout = {
            title: 'Ventas de x Producto',
            xaxis: {
              tickangle: -45
            },
            barmode: 'group'
          };
          Plotly.newPlot('graph-container', responseData.data, layout);
        },
        error: function(xhr, status, error) {
            console.log(error);
        }
    });
}
  enviarPeticion(3)