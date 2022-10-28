<!DOCTYPE html>
<html lang="en">

<head>
  <title>CyberKong</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="styles/main.css" type="text/css">
  <link rel="stylesheet" href="styles/productos.css" type="text/css">
</head>

<body>

  <div class="main-header">
    <button onclick="location.href = 'mainpage'" class="main-nav-btn">
      Pagina Principal
    </button>
    <button onclick="location.href = 'profile'" class="main-nav-btn">
      Perfil
    </button>
    <button onclick="location.href = '#'" class="main-nav-btn">
      carrito de compras
    </button>
  </div>

  <section class="main-page">
    <div class="product-container">
      <section id="presentation">

        <div id="carouselExampleControls" class="bg-dark carousel slide" data-ride="carousel" style="width: 50em">
          <div class="carousel-inner d-flex">
            <div class="carousel-item active">
              <img class="d-block w-50" src="./images/mainPage/grafica.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-50" src="./images/mainPage/grafica.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-50" src="./images/mainPage/grafica.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <h1>@Nombre del producto</h1>
        <hr>
        <p>@Descripcion del producto</p>
        <p>$ @precio del producto</p>

        <div class="product-rate">
          calificacion:
          <span class="fa fa-star checked-star"></span>
          <span class="fa fa-star checked-star"></span>
          <span class="fa fa-star checked-star"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
        </div>
        <hr>
      </section>
      <section id="actions">
        <button id="add-prod">añadir al carrito</button>
        <button id="list-prod">añadir a una lista</button>
        <button onclick="location.href ='./message' " id="cotizacion-prod">solicitar cotizacion</button>
      </section>
      <section id="comments">
        <hr>
        <form id="comment-form" action="./" method="post">
          <p>Escribe un comentario:</p>
          <div class="rate-section">
            <h2>calificar</h2>
            <button class="rate-btn fa fa-star"></button>
            <button class="rate-btn fa fa-star"></button>
            <button class="rate-btn fa fa-star"></button>
            <button class="rate-btn fa fa-star"></button>
            <button class="rate-btn fa fa-star"></button>
          </div>
          <textarea name="" id="" cols="30" rows="10"></textarea>
          <input type="submit" value="Enviar">
        </form>
        <hr>
        <div class="user-product-comment c-top">
          <h1>@nombre de usuario</h1>
          <p>@comentario</p>
          <div class="product-rate">
            calificacion:
            <span class="fa fa-star checked-star"></span>
            <span class="fa fa-star checked-star"></span>
            <span class="fa fa-star checked-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
          </div>
          <div class="c-division"></div>
        </div>
      </section>
    </div>
  </section>

  <script>
    const buttons = document.getElementsByClassName("rate-btn")
    console.log(buttons)
    let id = 0
    for (let i = 0; i < 5; i++) {
      buttons[i].onmouseover = () => {
        id = i
        console.log(id)
      }
      /*buttons[i].onmouseover = () => {
          buttons[i].style.color = "orange"
      }
      */
    }
  </script>