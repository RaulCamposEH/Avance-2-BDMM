<!DOCTYPE html>
<html lang="en">
<head>
  <title>CyberKong</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="styles/main.css" type="text/css">
  <link rel="stylesheet" href="styles/loginpage.css" type="text/css">
  <link rel="stylesheet" href="styles/mainpage.css" type="text/css">
</head>
<body>
  <?php require "app/layouts/navbar.html"; ?>

  <div class="main-header">
    <button onclick="location.href = 'profile'" class="main-nav-btn">
      Perfil
    </button>
    <button onclick="reveal('categories-section')" class="main-nav-btn">Categorias </button>
    <button onclick="reveal('lists-section')" class="main-nav-btn">Listas </button>
    <button onclick="location.href = '#'" class="main-nav-btn">
      carrito de compras
    </button>
  </div>

  <section class="main-page">
    <div class="main-body">
      <section class="product-body">
        <section class="product-section">
          <h1 class="bar-title">Productos Populares</h1>
          <div class="bar-container">
          </div>
        </section>
        <section class="product-section">
          <h1 class="bar-title">Mas Vendidos</h1>
          <div class="bar-container">
          </div>
        </section>
        <section class="product-section">
          <h1 class="bar-title">Mas Vendidos</h1>
          <div class="bar-container">

          </div>
        </section>
      </section>
      <div class="slide-section" id="categories-section">
        <section class="categories">
          <h4>Categorias</h4>
          <hr>
          <button onclick="location.href='./buscar-por-categoria'" type="button" class="btn btn-primary">Buscar por categoria</button>
          <hr>
          <ul class="flexdisplay-col">
            <li>
              <a class="cat-tag" href="#">
                <span href="#" class="category-name">category a</span>
                <img src="./images/mainPage/tag.svg" class="icon-tag" alt="">
              </a>
            </li>
            <li>
              <a class="cat-tag" href="#">
                <span href="#" class="category-name">category a</span>
                <img src="./images/mainPage/tag.svg" class="icon-tag" alt="">
              </a>
            </li>
            <li>
              <a class="cat-tag" href="#">
                <span href="#" class="category-name">category a</span>
                <img src="./images/mainPage/tag.svg" class="icon-tag" alt="">
              </a>
            </li>
            <li>
              <a class="cat-tag" href="#">
                <span href="#" class="category-name">category a</span>
                <img src="./images/mainPage/tag.svg" class="icon-tag" alt="">
              </a>
            </li>
            <li>
              <a class="cat-tag" href="#">
                <span href="#" class="category-name">category a</span>
                <img src="./images/mainPage/tag.svg" class="icon-tag" alt="">
              </a>
            </li>
            <li>
              <a class="cat-tag" href="#">
                <span href="#" class="category-name">category a</span>
                <img src="./images/mainPage/tag.svg" class="icon-tag" alt="">
              </a>
            </li>

          </ul>
        </section>
      </div>
      <div class="slide-section" id="lists-section">
        <section class="prod-lists">
          <h4>Crear Lista</h4>
          <hr>
          <form action="">
            <label for="list-title">Titulo</label>
            <input class="styled-input" type="text" name="" id="list-title">
            <label for="list-desc">Descripcion:</label>
            <textarea class="styled-input styled-ta" name="" id="list-desc" cols="18" rows="10"></textarea>
            <input class="styled-btn" type="submit" value="Crear lista">
          </form>
          <hr>
          <h4>Listas existentes</h4>
          <div class="styled-list">
            <ul>
              <li><a href="">Lista Deseados 1</a></li>
              <li><a href="">Lista Deseados 2</a></li>
              <li><a href="">Lista Deseados 3</a></li>
              <li><a href="">Lista Deseados 4</a></li>
              <li><a href="">Lista Deseados 5</a></li>
            </ul>
          </div>
        </section>
      </div>
    </div>
  </section>

  <script>
    const elements = document.getElementsByClassName("bar-container")

    Array.from(elements).forEach((el) => {
      el.innerHTML = `
            <div class="product-list-items">
                <div class="item">
                    <a href="./productpage">
                        <img src="./images/mainPage/grafica.jpg" alt="imagen producto">
                        <h3>@ProductName</h3>
                        <div class="product-rate">
                            <span class="fa fa-star checked-star"></span>
                            <span class="fa fa-star checked-star"></span>
                            <span class="fa fa-star checked-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </div>
                    </a>
                </div>
            </div>
            `
    });

    function reveal(id) {
      let elements = document.getElementsByClassName("slide-section");
      let slide_size = '50%'

      const el = document.getElementById(id)
      if (el.style.width == slide_size) {
        el.style.width = "0"
        el.style.opacity = "0"
      } else {
        for (let i = 0; i < elements.length; i++) {
          elements[i].style.width = "0"
          elements[i].style.opacity = "0"
        }
        el.style.width = slide_size
        el.style.opacity = "100%"
      }
    }
  </script>

  <?php require "app/layouts/footer.html"; ?>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>