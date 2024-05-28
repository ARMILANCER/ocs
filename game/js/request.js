var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        var userData = JSON.parse(this.responseText);
        if(userData.error) {
            document.getElementById("user_info").innerHTML = userData.error;
        } else {
            document.getElementById("user_info").innerHTML = "ID: " + userData.id + "<br>Nickname: " + userData.nickname + "<br>Mail: " + userData.mail;
        }
    }
};
xhttp.open("GET", "../php/home.php", true);
xhttp.send();