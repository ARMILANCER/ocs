function getScenarioData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var scenarios = JSON.parse(this.responseText);
      document.getElementById("h_title").innerHTML = scenarios[1].name;
      document.getElementById("p_state").innerHTML = scenarios[1].description;
      document.getElementById("div_img").style.backgroundImage = "url('" + scenarios[1].image + "')";
      document.getElementById("p_choicex").innerHTML = scenarios[1].choice1;
      document.getElementById("p_choicey").innerHTML = scenarios[1].choice2;
    }
  };
  xhttp.open("GET", "../php/request.php", true);
  xhttp.send();
}

window.onload = function() {
  getScenarioData();
};