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
  <script src="https://code.jquery.com/jquery-3.6.1.js" 
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
  crossorigin="anonymous"></script>
  <script>
    $(document).ready(function() {
      //
      $("#frm-login").on('submit', function(e) {
        e.preventDefault();
        let $err = $('#err');
        let form_data = new FormData(this);
        for (const value of form_data.values()) {
          console.log(value);
        }
        $.ajax({
          url: 'api/user_login',
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
                  setTimeout(function () {
                    sessionStorage.setItem("token", response.result.token)
                    sessionStorage.setItem("rol", response.result.rol)
                    sessionStorage.setItem("state", response.result.estado)
                    var form = $(document.createElement('form'));
                    $(form).attr("action", "profile");
                    $(form).attr("method", "POST");
                    $(form).css("display", "none");

                    var inp_username = $("<input>")
                    .attr("type", "text")
                    .attr("name", "username")
                    .val(form_data.get("username"));
                    $(form).append($(inp_username));


                    var inp_pass = $("<input>")
                    .attr("type", "text")
                    .attr("name", "password")
                    .val(form_data.get("password"));
                    $(form).append($(inp_pass));  

                    form.appendTo( document.body );
                    //$(form).submit();
                    window.location.href = "profile"; 
                  }, 1500);
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
  <?php require "app/layouts/navbar.html";?>

  <div id="err" class="alert alert-danger d-none"></div>
  <section class="login-section">

    <div class="custom-label">
      <b>
        <h1 style="color:midnightblue">Inicia Sesion!</h1>
      </b>
    </div>

    <form class="bg-dark" action="./mainpage" id="frm-login" method="post">
      <div class="d-flex flex-row justify-content-between">
        <label for="inp-login-user">Usuario :</label>
        <input class="styled-input" name="username" type="text" id="inp-login-user" required title="ingrese un usuario">
      </div>
      <div class="d-flex flex-row justify-content-between">
        <label for="inp-login-pass">Contraseña :</label>
        <input class="styled-input" name="password" type="password" id="inp-login-pass" required title="ingrese una contraseña">
      </div>
      <input class="styled-btn" type="submit" value="Entrar" id="inp-login-submit">
      <a href="./register">¿Aun no tienes una cuenta? </a>
    </form>

  </section>

  <?php require "app/layouts/footer.html";?>

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>