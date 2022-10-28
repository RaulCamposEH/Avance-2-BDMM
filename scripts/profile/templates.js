function editProfile()
{
  const _email = sessionStorage.getItem("s_email")
  const _user = sessionStorage.getItem("s_user")
  const rol = parseInt(sessionStorage.getItem("s_rol")) 
  const _rol_op1 = rol == 1 ? "selected" : ""
  const _rol_op2 = rol == 2 ? "selected" : ""
  const nombreAr = sessionStorage.getItem("s_name").toString().split(" ", 4)
  const _name = nombreAr[0] + " " + nombreAr[1]
  const _apPat = nombreAr[2]
  const _apMat = nombreAr[3]
  const sex = parseInt(sessionStorage.getItem("s_sexo"))
  const _sexo_op1 = sex == 1 ? "selected" : ""
  const _sexo_op2 = sex == 2 ? "selected" : ""
  const _sexo_op3 = sex == 3 ? "selected" : ""
  const s_nac = sessionStorage.getItem("s_nac")

  $("#profile-content").html(
    `
      <form class="bg-dark" action="core/Controllers/user_edit" id="frm-edits" method="post" autocomplete="off" enctype="multipart/form-data">
        <div class="input-data">
          <div class="userdata inp-label">
            <div class="d-flex flex-row justify-content-between">

              <label for="inp-edit-email">Email :</label>
              
              <input 
              class="styled-input" name="email" type="text" id="inp-edit-email" 
              pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$" 
              title="email no valido" 
              value="${_email}"
              required>

            </div>

            <div class="d-flex flex-row justify-content-between">

              <label for="inp-register-user">Usuario :</label>

              <input 
              class="styled-input" name="user" type="text" id="inp-edit-user" 
              pattern="(.*){3}" 
              title="usuario no valido" 
              value="${_user}"
              required>

            </div>

            <div class="d-flex flex-row justify-content-between">

              <label for="inp-register-rol">Rol de usuario :</label>

              <select class="styled-input" name="user-rol" id="inp-register-rol">
                <option value="1" ${_rol_op1}>
                  Comprador
                </option>
                <option value="2" ${_rol_op2}>
                  Vendedor
                </option>
              </select>

            </div>
            
            <div class="d-flex flex-row justify-content-between">

              <label for="inp-register-name">Nombres :</label>

              <input class="styled-input" name="nombre" type="text" id="inp-register-name" 
              pattern="[A-Za-z, ,ñ,Ñ]{3,20}" title="Solo se pueden usar letras" 
              value="${_name}"
              required>

            </div>

            <div class="d-flex flex-row justify-content-between">

              <label for="inp-register-a-paterno">Apellido Paterno :</label>

              <input class="styled-input" name="A-paterno" type="text" id="inp-register-a-paterno" 
              pattern="[A-Za-z, ,ñ,Ñ]{3,20}" title="Solo se pueden usar letras" 
              value="${_apPat}"
              required>

            </div>

            <div class="d-flex flex-row justify-content-between">

              <label for="inp-register-a-materno">Apellido Materno :</label>

              <input class="styled-input" name="A-materno" type="text" id="inp-register-a-materno" 
              pattern="[A-Za-z, ,ñ,Ñ]{3,20}" title="Solo se pueden usar letras" 
              value="${_apMat}"
              required>

            </div>

            <div class="d-flex flex-row justify-content-between">

              <label for="inp-register-sexo">Sexo :</label>

              <select class="styled-input" name="sexo" id="inp-register-sexo">
                <option value="1" ${_sexo_op1}>Hombre</option>
                <option value="2" ${_sexo_op2}>Mujer</option>
                <option value="3" ${_sexo_op3}>Otro</option>
              </select>

            </div>

            <div class="d-flex flex-row justify-content-between">

              <label for="inp-register-bornDate">Fecha de nacimiento :</label>

              <input class="styled-input" name="born-date" type="date" id="inp-register-bornDate" 
              value="${s_nac}"
              required>

            </div>
          </div>
        </div>  
        <div class="extra">

          <div class="d-flex flex-row justify-content-between">

            <label class="non_selectable" for="inp-registr-file" id="custominp-openfile">Seleccionar Archivo</label>

            <input name="imagefile" type="file" id="inp-registr-file" style="display: none" required accept=".png, .jpg">

          </div>

        </div>
        <input class="styled-btn" type="submit" value="Editar" id="inp-edit-submit">
      </form>
    `
  )
}

function userListas(){
  //hacer funcion en ajax para traer los productos
  $("#profile-content").html(
    `
      <h1>Listas</h1>
      <hr>
      <div class="list-container">
        <a href="./">
          <div>
            <img src="./images/mainPage/grafica.jpg" alt="img1">
            <img src="./images/mainPage/grafica.jpg" alt="img2">
            <img src="./images/mainPage/grafica.jpg" alt="img3">
            <img src="./images/mainPage/grafica.jpg" alt="img4">
            <img src="./images/mainPage/grafica.jpg" alt="img5">
          </div>
          <div>
            <h1>@listname</h1>
            <p>@listdesc</p>
          </div>
        </a>
      </div>
    `
  )
}

$(document).ready(function () {
  const token = sessionStorage.getItem("token");
  let SendInfo = {
    user_token: token,
  };
  console.log(SendInfo.user_token)
  $.ajax({
    url: 'api/user_get',
    contentType: "application/json; charset=utf-8",
    traditional: true,
    data: JSON.stringify(SendInfo),
    type: 'post', 
    success: function (response) {
      response = JSON.stringify(response) // primero se hace string obligatorio por que 
      response = JSON.parse(response)

      const usuario = response.result.usuario
      const image = response.result.image
      const imgtype = response.result.imgtype

      sessionStorage.setItem("s_email", response.result.email)
      sessionStorage.setItem("s_user", usuario)
      sessionStorage.setItem("s_name", response.result.nombre_completo)
      sessionStorage.setItem("s_sexo", response.result.sexo)
      sessionStorage.setItem("s_nac", response.result.fecha_nacimiento)
      sessionStorage.setItem("s_token", response.result.token)
      sessionStorage.setItem("s_rol", response.result.rol)
      sessionStorage.setItem("s_state", response.result.state)
      sessionStorage.setItem("s_image", image)
      sessionStorage.setItem("s_imagetyp", imgtype)

      if (response.result.state == 2) {
        
      }
      else {
        $("#profile-info").html(
          `
            <div class="marco-perfil">
                <img id="user-profilepic" src="data:${imgtype};base64,${image}"/>
            </div>
            <h5>${usuario}</h5>
            <div id="ProfileActions">
                <button onclick="editProfile()" type="button" class="profile-option">Editar</button>
                <button onclick="userListas()" type="button" class="profile-option">Listas</button>
                <button type="button" class="profile-option">Carrito</button>
                <button type="button" class="profile-option">Historial</button>
            </div>
          `
        )
      }
    }
  });
})