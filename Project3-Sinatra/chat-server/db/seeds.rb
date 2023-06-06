puts "Creating seed"

users = [
    { name: 'Morris', password: '1234'},
    { name: 'David', password: '5678'},
    { name: 'Lisa', password: '1234'}
]


games = [
    {title: 'FIFA23', description: 'FIFA games strive to provide an authentic football experience with realistic player animations, stadium atmospheres, and commentary. They often feature a wide range of licensed teams, leagues, and players from around the world, offering an immersive football experience for fans.'},
    {title: 'MK11', description: 'The Mortal Kombat series is renowned for its diverse roster of characters, each with their own unique fighting styles, special moves, and backstory. Some of the most recognizable characters include Scorpion, Sub-Zero, Liu Kang, Raiden, Sonya Blade, and many more. Each character has their own storyline and motivations, often intertwining with the larger narrative of the Mortal Kombat universe.'},
    {title: 'GOD OF WAR', description: 'The main protagonist, Kratos, is a former Spartan captain who becomes a tragic and complex anti-hero. Driven by his thirst for revenge, he battles against the gods who have wronged him, manipulated him, and caused immense suffering in his life. As the series progresses, Kratos faces various gods, mythical creatures, and powerful beings, navigating a world filled with challenges, puzzles, and intense combat encounters.'}
]


reviews = [
    {star_rating: 4, comments: 'Love the game'},
    {star_rating: 5, comments: 'Best Graphics ever'},
    {star_rating: 3, comments: 'Not sure about the hype though'}
]


games.each do |game|
    game = Game.create(game)

    users.each do |user|
        user = User.create(user)


        review = reviews.sample.merge(game_id: game.id, user_id: user.id)
        Review.create(review)

    end
end

puts "Done Seeding"