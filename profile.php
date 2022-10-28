<?php
$datos = $_POST;
?>
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
  <link rel="stylesheet" href="styles/profilepage.css" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
  <script src="scripts/profile/templates.js">
  </script>
</head>

<body>
  <?php require "app/layouts/navbar.html"; ?>

  <div class="main-header">
    <button onclick="location.href = 'mainpage'" class="main-nav-btn">
      Pagina principal
    </button>
    <button onclick="" class="main-nav-btn">
      Listas
    </button>
    <button class="main-nav-btn">
      carrito de compras
    </button>
    <button class="main-nav-btn">
      Historial
    </button>
  </div>

  <section class="main-page">
    <div id="test"></div>
    <div id="profile-body">
      <div class="profile-info" id="profile-info">
      </div>
      <section class="profile-content" id="profile-content">
      </section>
    </div>
  </section>

  <script>
    let el = document.getElementById("profile-body")

    const template_private = () => {
      el.innerHTML = `
            <div class="profile-info">
                    <div class="marco-perfil">
                        <img id="profile-pic" src="./images/mainPage/user.png" alt="imagen de perfil">
                    </div>
                    <h1>@usuario</h1>
                    <button>Editar</button>
                </div>
                <section class="profile-content">
                    <h1>Usuario privado</h1>
                    <hr>
                    <p class="msg-private">lo sentimos no se puede mostrar informacion de este usuario!</p>
                </section>
            </div>
            `
    }

    const template_vendor = () => {
      el.innerHTML = `
           
            <div class="profile-info">
                    <div class="marco-perfil">
                        <img id="profile-pic" src="./images/mainPage/user.png" alt="imagen de perfil">
                    </div>
                    <h1>@usuario</h1>
                    <button>Editar</button>
                </div>
                <section class="profile-content">
                    <h1>Productos Publicados</h1>
                    <hr>
                    <button onclick="location.href='./agregar-producto'" type="button" class="btn btn-primary">Vender Producto</button>
                    <div class="products-section">
                    
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>
                        <div class="product-box">
                            <a href="">
                                <img src="./images/mainPage/grafica.jpg" alt="product image">
                                <h3>@product-name</h3>
                                <p>@produc-desc</p>
                            </a>
                            <div class="product-options">
                                <button class="prod-btn" id="edit-prod"><img src="./images/mainPage/edit.svg" alt=""></button>
                                <button class="prod-btn" id="delete-prod"><img src="./images/mainPage/delete.svg" alt=""></button>
                            </div>
                        </div>                        
                    </div>
                </section>
            </div>
            `
    }

    const template_admin = () => {
      el.innerHTML = `
        <div class="profile-info">
            <div class="marco-perfil">
                <img id="profile-pic" src="./images/mainPage/user.png" alt="imagen de perfil">
            </div>
            <h1>@usuario</h1>
            <button>Editar</button>
        </div>
        <section class="profile-content">
            <h1>Admin</h1>
            <hr>

        </section>
        `
    }

    //template_public();

    function mostrar(type) {

      const showElement = {
        'publico': template_public,
        'privado': template_private,
        'vendedor': template_vendor,
        'admin': template_admin
      }

      const templateShow = showElement[type]

      //templateShow()
    }
  </script>


  <?php require "app/layouts/footer.html"; ?>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>