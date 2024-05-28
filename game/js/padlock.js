document.addEventListener('DOMContentLoaded', function() {
    const button = document.getElementById('but_padlock');
    let isLocked = false;

    // Funzione per gestire il blocco/sblocco della pagina
    function togglePageLock() {
        const container = document.querySelector('.div_container');
        if (isLocked) {
            // Blocca lo scorrimento verticale della pagina
            container.classList.add('locked');

            button.style.backgroundImage = "url('../img/locked.svg')";
        } else {
            // Sblocca lo scorrimento verticale della pagina
            container.classList.remove('locked');

            button.style.backgroundImage = "url('../img/unlocked.svg')";
        }
    }

    button.addEventListener('click', function() {
        isLocked = !isLocked;
        togglePageLock();
    });
});