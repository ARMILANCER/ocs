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