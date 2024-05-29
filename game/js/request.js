function getScenarioData() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        var data = JSON.parse(this.responseText);
        document.getElementById("h_title").innerHTML = data.title;
        document.getElementById("p_state").innerHTML = data.state;
      }
    };
    xhttp.open("GET", "get_scenario.php", true);
    xhttp.send();
  }
  window.onload = function() {
    getScenarioData();
  };
  