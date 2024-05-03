(function() {
  "use strict";

  var tables = document.querySelectorAll('table.tableblock.frame-all.grid-all.stretch');
  tables.forEach(function(table) {
    var wrapper = document.createElement('div');
    wrapper.className = 'table_wrapper';
    table.parentNode.insertBefore(wrapper, table);
    wrapper.appendChild(table);
  });

})();