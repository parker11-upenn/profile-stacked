/**
 * Toggles a profile image visibility based on a checkbox or click event
 * @param {string} personId - The unique ID of the person
 * @param {boolean} isVisible - Whether to show or hide
 */
function toggleProfileAvatar(personId, isVisible) {
    const targetTile = document.getElementById('img_' + personId);
    if (targetTile) {
        targetTile.style.display = isVisible ? 'block' : 'none';
    }
}

// Global listener for any checkbox with the 'img-toggle' class
document.addEventListener('change', function(e) {
    if (e.target.classList.contains('img-toggle')) {
        toggleProfileAvatar(e.target.value, e.target.checked);
    }
});