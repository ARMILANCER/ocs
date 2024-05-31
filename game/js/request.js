var scenarios = [];
var currentScenarioIndex = 0;
var click = false;

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('but_forward').addEventListener('click', getInfoGame);
    document.getElementById('but_back').addEventListener('click', getInfoGame);
});

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

function getCharacterData() {
  function loadTrama() {
      fetch('../trama.txt')
          .then(response => response.text())
          .then(data => {
              const container = document.getElementById('specific');
              container.innerHTML = '';

              const title = document.createElement('h2');
              title.textContent = 'Trama';
              container.appendChild(title);

              const trama = document.createElement('p');
              trama.textContent = data;
              container.appendChild(trama);
          })
          .catch(error => console.error('Errore nel caricamento della trama:', error));
  }

  function loadCharacters() {
      fetch('../php/requestInfo.php')
          .then(response => response.json())
          .then(data => {
              const container = document.getElementById('specific');
              container.innerHTML = '';
              data.forEach(character => {
                  const card = document.createElement('div');
                  card.classList.add('character-card');

                  const img = document.createElement('img');
                  img.src = character.image;
                  img.alt = character.name;

                  const name = document.createElement('h3');
                  name.textContent = character.name;

                  const description = document.createElement('p');
                  description.textContent = character.long_description;

                  card.appendChild(img);
                  card.appendChild(name);
                  card.appendChild(description);

                  container.appendChild(card);
              });
          })
          .catch(error => console.error('Errore nel caricamento dei dati:', error));
  }

  if (this.id === 'but_forward') {
      loadCharacters();
  } else if (this.id === 'but_back') {
      loadTrama();
  }
}

document.getElementById('but_forward').addEventListener('click', getCharacterData);
document.getElementById('but_back').addEventListener('click', getCharacterData);


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