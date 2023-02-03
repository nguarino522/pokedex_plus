document.addEventListener("DOMContentLoaded", (event) => {

    // hide spinner after DOM load up
    hideLoadingView();


    // Show the loading spinner
    function showLoadingView() {
        $("#load").show();
    }


    // Hide the loading spinner
    function hideLoadingView() {
        $("#load").hide();
    }

});