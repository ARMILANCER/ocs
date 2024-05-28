document.addEventListener('DOMContentLoaded', function() {
    const button = document.getElementById('but_padlock');
    let isLocked = false;

    // Funzione per gestire il blocco/sblocco della pagina
    function togglePageLock() {
        if (isLocked) {
            // Blocca lo scorrimento verticale della pagina
            button.style.backgroundImage = "url('../img/locked.svg')";
            document.body.style.overflow = 'hidden';
            document.documentElement.style.overflow = 'hidden';
            // Riporta l'utente all'inizio della pagina
            window.scrollTo({ top: 0, behavior: 'smooth' });
        } else {
            // Sblocca lo scorrimento verticale della pagina
            button.style.backgroundImage = "url('../img/unlocked.svg')";
            document.body.style.overflow = '';
            document.documentElement.style.overflow = '';
        }
    }

    button.addEventListener('click', function() {
        isLocked = !isLocked;
        togglePageLock();
    });

    // Blocca la pagina se il bottone è già bloccato quando la finestra viene ridimensionata o lo scorrimento avviene
    window.addEventListener('resize', togglePageLock);
    window.addEventListener('scroll', function() {
        if (isLocked) {
            // Impedisce lo scorrimento se la pagina è bloccata
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    });
});