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
  <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
  <script>
    $(document).ready(function() {
      //
      $("#frm-register").on('submit', function(e) {
        e.preventDefault();
        let $err = $('#err');
        let form_data = new FormData(this);
        /*
        for (const value of form_data.values()) {
          console.log(value);
        }*/
        $.ajax({
          url: 'api/user_register',
          dataType: 'text',
          cache: false,
          contentType: false,
          processData: false,
          data: form_data,
          type: 'post',
          success: function(result) {
            console.log(result)
            if (result) {
              let response = JSON.parse(result)
              alert(JSON.stringify(response))
              console.log(response);
              if (response.result) {
                if (response.status == "ok") {
                  $err.removeClass('alert-danger').removeClass('d-none').addClass('alert-success').html(response.result.status_content)
                  return
                } else if (response.status == "error") {
                  $err.removeClass('d-none').html(response.result.status_content)
                  return
                }
              }
            }
          }
          //quitar el content type json de php user_register.php si algo anda mal
        });
      })
    });
  </script>
</head>

<body>
<?php require "app/layouts/navbar.html"; ?>

  <div id="err" class="alert alert-danger d-none"></div>
  <section class="login-section">

    <div class="custom-label">
      <h1 style="color:midnightblue">Registrate!</h1>
    </div>
    <form class="bg-dark" action="core/Controllers/user_register" id="frm-register" method="post" autocomplete="off" enctype="multipart/form-data">
      <div class="input-data">
        <div class="userdata inp-label">
          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-email">Email :</label>
            <input class="styled-input" name="email" type="text" id="inp-register-email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$" title="email no valido" required>
          </div>
          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-user">Usuario :</label>
            <input class="styled-input" name="user" type="text" id="inp-register-user" pattern="(.*){3}" title="usuario no valido" required>
          </div>
          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-password">Contraseña :</label>
            <input class="styled-input" name="password" type="password" id="inp-register-password" pattern="^(?=.*\d)(?=.*[^A-Za-z\d]).{8,}" title="contraseña no valida" required>
          </div>
          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-cpassword">Confirmar Contraseña :</label>
            <input class="styled-input" name="cPassword" type="password" id="inp-register-cpassword" required>
          </div>

          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-rol">Rol de usuario :</label>
            <select class="styled-input" name="user-rol" id="inp-register-rol">
              <option value="1" selected>Comprador</option>
              <option value="2">Vendedor</option>
            </select>
          </div>
        </div>

        <div class="personaldata inp-label">
          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-name">Nombres :</label>
            <input class="styled-input" name="nombre" type="text" id="inp-register-name" pattern="[A-Za-z, ,ñ,Ñ]{3,20}" title="Solo se pueden usar letras" required>
          </div>

          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-a-paterno">Apellido Paterno :</label>
            <input class="styled-input" name="A-paterno" type="text" id="inp-register-a-paterno" pattern="[A-Za-z, ,ñ,Ñ]{3,20}" title="Solo se pueden usar letras" required>
          </div>

          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-a-materno">Apellido Materno :</label>
            <input class="styled-input" name="A-materno" type="text" id="inp-register-a-materno" required>
          </div>

          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-sexo">Sexo :</label>
            <select class="styled-input" name="sexo" id="inp-register-sexo">
              <option value="1" selected>Hombre</option>
              <option value="2">Mujer</option>
              <option value="3">Otro</option>
            </select>
          </div>

          <div class="d-flex flex-row justify-content-between">
            <label for="inp-register-bornDate">Fecha de nacimiento :</label>
            <input class="styled-input" name="born-date" type="date" id="inp-register-bornDate" required>
          </div>
        </div>
      </div>

      <div class="extra">
        <div class="d-flex flex-row justify-content-between">
          <label class="non_selectable" for="inp-registr-file" id="custominp-openfile">Seleccionar Archivo</label>
          <input name="imagefile" type="file" id="inp-registr-file" style="display: none" required accept=".png, .jpg">
        </div>

      </div>
      <input class="styled-btn" type="submit" value="Registrarse" id="inp-register-submit">
      <a href="./login">¿Ya tienes cuenta? inicia sesion</a>
    </form>
  </section>

  <?php require "app/layouts/footer.html"; ?>

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <script src="./scripts/register_validations.js"></script>
</body>

</html>