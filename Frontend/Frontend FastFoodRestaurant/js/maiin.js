// add hovered class to selected list item
let list = document.querySelectorAll(".navigation li");

function activeLink() {
  list.forEach((item) => {
    item.classList.remove("hovered");
  });
  this.classList.add("hovered");
}

list.forEach((item) => item.addEventListener("mouseover", activeLink));

// Menu Toggle
let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".maiin");

toggle.onclick = function () {
  navigation.classList.toggle("active");
  main.classList.toggle("active");
};
   


function loadPage(page) {
  const contentDiv = document.getElementById('content');
  fetch(`/${page}.html`)
      .then(response => response.text())
      .then(html => contentDiv.innerHTML = html)
      .catch(error => console.warn(error));
}
function loadContent(page) {
  const contentDiv = document.getElementById('content');
  switch (page) {
  
    case 'ordenes':
      loadPage('Ordenes')
      break;
    case 'ventas':
      loadPage('Ventas')
      break;
    case 'compras':
      loadPage('Compras')
      break;
    case 'inventario':
      loadPage('Inventario')
      break;
    case 'empleados':
      loadPage('EmpleadosUser')
      break;
    case 'historial':
      loadPage('Historial')
      break;
    case 'configuracion':
      loadPage('Configuraciones')
      break;
  }
}