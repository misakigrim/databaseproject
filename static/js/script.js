// https://www.cluemediator.com/how-to-disable-the-browser-back-button-using-javascript
function disableBack() { window.history.forward(); }
setTimeout("disableBack()", 0);
window.onunload = function () { null };