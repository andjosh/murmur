(function(window, document) {
    var queryError = window.location.search.split('error=').length > 1,
        legend = document.querySelector('legend');

    if (queryError) {
        legend.textContent = 'There was an error saving your email.';
        legend.style.color = 'red';
    }
})(this, this.document);
