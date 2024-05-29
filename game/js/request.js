function getScenarioData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var data = JSON.parse(this.responseText);

      for (var i = 0; i < data.length; i++) {
        var scenario = data[i];
        var titleElement = document.createElement("h2");
        titleElement.textContent = scenario.name;
        document.getElementById("div_situation").appendChild(titleElement);
        
        var descriptionElement = document.createElement("p");
        descriptionElement.textContent = scenario.description;
        document.getElementById("div_situation").appendChild(descriptionElement);
      }
    }
  };
  xhttp.open("GET", "../php/request.php", true);
  xhttp.send();
}

window.onload = function() {
  getScenarioData();
};
