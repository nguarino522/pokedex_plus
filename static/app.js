document.addEventListener("DOMContentLoaded", async (event) => {
    
    // enable popovers for bootstrap
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
    
    // hide spinner after DOM load up better looking have it go for 300 ms
    setTimeout( () => hideLoadingView(), 400);
    

    // Show the loading spinner
    function showLoadingView() {
        $("#load").show();
    }


    // Hide the loading spinner
    async function hideLoadingView() {
        $("#load").hide();
    }


    // close popover after 5 seconds
    $(".pop").popover({ trigger: "manual" }).click(function () {
        var pop = $(this);
        pop.popover("show")
        pop.on('shown.bs.popover', function () {
            setTimeout(function () {
                pop.popover("hide")
            }, 5000);
        })
    });
});