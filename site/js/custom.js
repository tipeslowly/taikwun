// Use this file to add custom JavaScript
//
// A number of JavaScript functions and libraries are included with Quire,
// to see which ones, check the files in themes/quire-starter-theme/source/js // and the list of dependencies in themes/quire-starter-theme/package.json


var elems = document.querySelectorAll('.no-zoom .inline.popup');
elems.forEach(function (el) {
  //el.parentNode.removeChild(el);

  el.removeAttribute('href');
  el.removeAttribute('class');
  var spanfig = el.querySelector('span.fig');
  spanfig.parentNode.removeChild(spanfig);
});
