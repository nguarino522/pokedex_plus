document.addEventListener("DOMContentLoaded", async (event) => {
    
    // get all favorite buttons
    const favBtns = Array.from(document.getElementsByClassName("fa-heart"));

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

    
    favBtns.forEach(favBtn => {
        favBtn.addEventListener("click", function (e) {
            e.preventDefault();
            //let favBtnParentElement = favBtn.parentElement
            let pokemon_id = favBtn.getAttribute("data-id");
            toggleFavorite(pokemon_id, favBtn);
        })
    })

    async function toggleFavorite(pokemon_id, favBtn) {
        let resp = await axios.post(`/users/toggle_favorite/${pokemon_id}`)
        console.log(resp.data.pokemon_favorited);
        console.log(resp);
        if (resp.data.pokemon_favorited === true) {
            favBtn.classList.remove("like-icon");
            favBtn.classList.add("favorited");
        } else {
            favBtn.classList.remove("favorited");
            favBtn.classList.add("like-icon");
        }
    }

});