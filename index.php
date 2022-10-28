<!DOCTYPE html>
<html lang="en">
<head>
    <title>CyberKong</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/main.css" type="text/css">
    <link rel="stylesheet" href="styles/mainpage.css" type="text/css">
</head>
<body>

    <?php require "app/layouts/navbar.html";?>

    <div id="carouselExampleControls" class="carousel slide carruseltop" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active txtcenter">
                <img class="txtcenter" src="images/landingPage/Carrusel1.png" alt="First slide">
            </div>
            <div class="carousel-item txtcenter">
                <img class="txtcenter" src="images/landingPage/Carrusel2.png" alt="Second slide">
            </div>
            <div class="carousel-item txtcenter">
                <img class="txtcenter" src="images/landingPage/Carrusel3.png" alt="Third slide">
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

    <div style="text-align:center" class="contenedor-imagenes">
        <a href="./productpage"><img src="images/mainPage/grafica.jpg" class="rounded" alt="..."></a>
        <a href="./productpage"><img src="images/mainPage/grafica.jpg" class="rounded" alt="..."></a>
        <a href="./productpage"><img src="images/mainPage/grafica.jpg" class="rounded" alt="..."></a>
        <a href="./productpage"><img src="images/mainPage/grafica.jpg" class="rounded" alt="..."></a>
    </div>

    <script>
        $('.carousel').carousel({
            interval: 4000
        })
    </script>

    <?php require "app/layouts/footer.html";?>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>

