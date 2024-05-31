var scenarios = [];
var currentScenarioIndex = 0;

function getScenarioData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      scenarios = JSON.parse(this.responseText);
      updateScenario();
    }
  };
  xhttp.open("GET", "../php/request.php", true);
  xhttp.send();
}

function getInfoGame() {
  fetch('../trama.txt')
  .then(response => response.text())
  .then(data => {
    var h1 = document.createElement("h1")
    var p = document.createElement("p");
    p.textContent = data;
    p.style.color = "black";
    specific.appendChild(p);
  })
  .catch(error => console.error('ERROR ON CHARGE', error));
}


window.onload = function() {
  getScenarioData();
  getInfoGame();
};

function updateScenario() {
  if (currentScenarioIndex < scenarios.length) {
    var scenario = scenarios[currentScenarioIndex];
    document.getElementById("h_title").innerHTML = scenario.name;
    document.getElementById("p_state").innerHTML = scenario.description;
    document.getElementById("div_img").style.backgroundImage = "url('" + scenario.image + "')";
    document.getElementById("p_choicex").innerHTML = scenario.choice1;
    document.getElementById("p_choicey").innerHTML = scenario.choice2;
  }
}

document.getElementById("but_choicex").addEventListener("click", function() {
  currentScenarioIndex++;
  if (currentScenarioIndex >= scenarios.length) {
    currentScenarioIndex = 0;
  }
  updateScenario();
});

document.getElementById("but_choicey").addEventListener("click", function() {
  currentScenarioIndex++;
  if (currentScenarioIndex >= scenarios.length) {
    currentScenarioIndex = 0;
  }
  updateScenario();
});