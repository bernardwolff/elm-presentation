(function() {
  function ready(fn) {
    if (document.readyState != 'loading'){
      fn();
    } else {
      document.addEventListener('DOMContentLoaded', fn);
    }
  }

  function formatMetrics(metrics){
    var oneThousand = 1000;
    var oneMillion = oneThousand * oneThousand;
    var oneBillion = oneMillion * oneThousand;

    metrics.forEach(function(metric){
      if (metric.value >= oneBillion) {
        metric.value = Math.floor(metric.value / oneBillion);
        return;
      }
      if (metric.value >= oneMillion) {
        metric.value = Math.floor(metric.value / oneMillion);
        return;
      }
    });
    return metrics;
  }

  function showInTable (metrics, table) {
    metrics.forEach(function(metric){
      var tr = document.createElement("tr");
      var tdValue = document.createElement("td");
      var tdYear = document.createElement("td");

      tdValue.textContent = metric.value;
      tdYear.textContent = metric.year;

      tr.appendChild(tdValue);
      tr.appendChild(tdYear);
      table.appendChild(tr);
    });
  }

  ready(function(){
    var metrics = [
      {value: 210394680, year: 2010},
      {value: 740276402, year: 2011},
      {value: 986737865, year: 2012},
      {value: 872356504, year: 2013}
    ];

    var formattedMetrics = formatMetrics(metrics);
    var formattedMetricsTable = document.getElementById("formatted-metrics");
    var originalMetricsTable = document.getElementById("original-metrics");

    showInTable(formattedMetrics, formattedMetricsTable);
    showInTable(metrics, originalMetricsTable);
  });
}());
