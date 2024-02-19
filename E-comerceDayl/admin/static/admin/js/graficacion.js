
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
    },2000);
});