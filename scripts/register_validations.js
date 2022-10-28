/*
let emailInput = document.getElementById("inp-register-email")
let userInput = document.getElementById("inp-register-user")
let bDateInput = document.getElementById("inp-register-bornDate")
let register_btn = document.getElementById("inp-register-submit")
*/

window.addEventListener('DOMContentLoaded', (event) => {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
    dd = '0' + dd;
    }

    if (mm < 10) {
    mm = '0' + mm;
    }
    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("inp-register-bornDate").setAttribute("max", today);
});


let passInput = document.getElementById("inp-register-password")
let passConfirm = document.getElementById("inp-register-cpassword")

passConfirm.onchange = () => {
    //const message = document.createElement("p");
    //message.innerText = "las contraseñas no coinciden";
    //message.setAttribute("class","val-message")
    if(passInput.value !== passConfirm.value){
        passConfirm.setCustomValidity("Las contraseñas no Coinciden");
        //console.log(contra2.validity.value)
    }
   else{
        passConfirm.setCustomValidity("");
   }
}


const fileInput = document.getElementById("inp-registr-file")
fileInput.onchange = () => {
    const selectedFile = fileInput.files[0];
    console.log(selectedFile);
    document.getElementById("custominp-openfile").style.backgroundColor = "#9beb50"
    document.getElementById("custominp-openfile").style.color = "#232323"
}