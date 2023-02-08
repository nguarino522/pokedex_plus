document.addEventListener("DOMContentLoaded", async (event) => {
    
    // get all favorite buttons and favorite buttons on favorite page
    const favBtns = Array.from(document.getElementsByClassName("favorite-icon-normal"));
    const favBtnsPage = Array.from(document.getElementsByClassName("favorite-icon-fav-page"));

    //get all pokemon cards on team creator page
    const pokemonTeamCreatorCards = Array.from(document.getElementsByClassName("team-creator-card"));

    // team creation input element and holding
    const pokemonIds = document.getElementById("pokemon_ids")

    // enable popovers for bootstrap
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
    
    // hide spinner after DOM loaded
    hideLoadingView();
    

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

    
    // favorite button for all pokemon cards and main single pokemon page even listeners 
    favBtns.forEach(favBtn => {
        favBtn.addEventListener("click", function (e) {
            e.preventDefault();
            let pokemon_id = favBtn.getAttribute("data-id");
            toggleFavorite(pokemon_id, favBtn);
            console.log(pokemon_id, favBtn)
        })
    });
    async function toggleFavorite(pokemon_id, favBtn) {
        let resp = await axios.post(`/users/toggle_favorite/${pokemon_id}`)
        if (resp.data.pokemon_favorited === true) {
            favBtn.classList.remove("like-icon");
            favBtn.classList.add("favorited");
        } else {
            favBtn.classList.remove("favorited");
            favBtn.classList.add("like-icon");
        }
    };


    // favorite button for favorites page, remove if unfavorited
    favBtnsPage.forEach(favBtn => {
        favBtn.addEventListener("click", function (e) {
            e.preventDefault();
            let favBtnElementToRemove = favBtn.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement;
            let pokemon_id = favBtn.getAttribute("data-id");
            removeFavoritePage(pokemon_id, favBtnElementToRemove);
        })
    });
    async function removeFavoritePage(pokemon_id, favBtnElementToRemove) {
        await axios.post(`/users/toggle_favorite/${pokemon_id}`)
        favBtnElementToRemove.classList.add("fadeoutremove");
        favBtnElementToRemove.remove();
    };


    // team creator page event listeners for selectiona 'animation'
    pokemonTeamCreatorCards.forEach(card => {
        card.addEventListener("click", function(e) {
            e.preventDefault();
            if (card.classList.contains("selected")) {
                let pid = (card.getAttribute("data-id"));
                // let currentValue = pokemonIds.value;
                let newValue = pokemonIds.value.replace(pid, "");
                pokemonIds.value = newValue;
                console.log(pokemonIds.value);
                card.classList.remove("selected");
            } else {
                let pid = (card.getAttribute("data-id"));
                let currentValue = pokemonIds.value;
                if (currentValue == "") {
                    pokemonIds.value = `${pid}`;
                } else {
                    pokemonIds.value = `${currentValue} ${pid}`;
                }
                card.classList.add("selected");
                console.log(pokemonIds.value);
            }
        })
    });

});