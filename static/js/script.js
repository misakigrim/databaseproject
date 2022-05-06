// https://www.cluemediator.com/how-to-disable-the-browser-back-button-using-javascript
function disableBack() { window.history.forward(); }
setTimeout("disableBack()", 0);
window.onunload = function () { null };

const submit = document.getElementById('submit')
const email = document.getElementById('email')
const password = document.getElementById('password')
const travelerName = document.getElementById('t_name')

submit.addEventListener('click', function() {
    if (email.innerText == '' || password.innerText == '' || travelerName.innerText == '') {
        alert("The fields cannot be empty!")
    else {
        continue
    }
    }
})