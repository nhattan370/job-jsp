const pwdInput = document.getElementById("password");
const toggle = document.getElementById("togglePassword");

toggle.addEventListener("click", function() {
    const type = pwdInput.getAttribute("type") === "password" ? "text" : "password";
    pwdInput.setAttribute("type", type);

    this.classList.toggle("ion-ios-eye");
    this.classList.toggle("ion-ios-eye-off");
});
