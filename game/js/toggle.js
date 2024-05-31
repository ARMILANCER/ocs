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
    let voiceoff = false;
    var audio = document.getElementById('background-music');
    function toggleVoice() {
        if (voiceoff) {
            audio.pause();
            button.style.backgroundImage = "url('../img/voiceoff.svg')";
        } else {
            audio.play();
            button.style.backgroundImage = "url('../img/voiceon.svg')";
        }
    }
    button.addEventListener('click', function() {
        isLocked = !isLocked;
        toggleVoice();
    });
});