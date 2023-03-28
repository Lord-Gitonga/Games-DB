function showCharacter(character){
    let nameElement = document.createElement('li')
    nameElement.textContent = character.name;
    nameElement.addEventListener('click', ()=>{
        fetch(`http://localhost:3000/characters/${character.id}`)
        .then(function(response){
            return response.json()
        })
        .then(function(character){

        
        let card = document.createElement('li')
        card.className = "card col-2 p-0 m-4"
        card.innerHTML = `
        <img src="${character.image}" class="card-img-top" alt="${character.name}">
        <div class="card-body">
        <h4 class="card-title">${character.name}</h4>
        <p class="card-text" id="vote-count">${character.votes}</p>
        <a href="#" class="btn btn-primary" id="vote-btn" data-id="${character.id}">Add vote</a>
        <button class="btn btn-primary" id="back-btn">Back</button>
        </div>
        `
        document.querySelector('#item-list').innerHTML = ""
        document.querySelector('#item-list').append(card)

        const voteBtn = card.querySelector('#vote-btn')
        voteBtn.addEventListener('click', ()=>{
        const voteCount = card.querySelector('#vote-count')
        character.votes++
        voteCount.textContent = character.votes
    })

    const backBtn = card.querySelector('#back-btn')
    backBtn.addEventListener('click', () => {
        location.reload()
    })
  })
})

document.querySelector('#item-list').append(nameElement);

}

function fetchAnimals (){
    fetch('http://localhost:3000/characters')
    .then(function(response){
        return response.json();
    })
    .then(function(characters){
        characters.forEach((character) => {
            showCharacter(character)
        }
        );
    })
}
fetchAnimals();

