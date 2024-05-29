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