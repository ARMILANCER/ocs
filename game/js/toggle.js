function playMusic() {
    var audio = document.getElementById('background-music');
    //audio.src = "../music/dinero.mp3";
    audio.src = "../music/main_soundtrack.mp3";
    audio.play().catch(function(error) {
        console.log('Autoplay prevented: ' + error);
    });
}
function hideOverlay() {
    document.getElementById('overlay').style.display = 'none';
    playMusic();
}


document.addEventListener('DOMContentLoaded', function() {
    const button = document.getElementById('but_padlock');
    let isLocked = false;

    function togglePageLock() {
        const container = document.querySelector('.div_container');
        if (isLocked) {
            container.classList.add('locked');
            button.style.backgroundImage = "url('../img/locked.svg')";
        } else {
            container.classList.remove('locked');
            button.style.backgroundImage = "url('../img/unlocked.svg')";
        }
    }
    button.addEventListener('click', function() {
        isLocked = !isLocked;
        togglePageLock();
    });
});

document.addEventListener('DOMContentLoaded', function() {
    let voiceoff = true;
    var audio = document.getElementById('background-music');
    var button = document.getElementById('but_voice');
    function toggleVoice() {
        if (voiceoff) {
            audio.pause();
            button.style.backgroundImage = "url('../img/voiceoff.png')";
        } else {
            audio.play();
            button.style.backgroundImage = "url('../img/voiceon.png')";
        }
        voiceoff = !voiceoff;
    }
    button.addEventListener('click', function() {
        toggleVoice();
    });
});
