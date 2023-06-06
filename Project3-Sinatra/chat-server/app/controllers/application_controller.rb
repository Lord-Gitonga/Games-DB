class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

##CRUD operations for Users
    get '/users' do
        user = User.all
        user.to_json
    end

    post '/users' do 
        user = User.create(
            name: params[:name],
            password: params[:password]
        )
        user.to_json
    end

    patch '/users/:id' do
        user = User.find(params[:id])
        user.update(
            name: params[:name],
            password: params[:password]
        )
        user.to_json
    end

    delete '/users/:id' do
        user = User.find(params[:id])
        user.destroy
        user.to_json
    end

## CRUD operations for games
    get '/games' do
        game = Game.all
        game.to_json
    end

    post '/games' do
        game = Game.create(
            title: params[:title],
            description: params[:description]
        )
        game.to_json
    end

    patch '/games/:id' do
        game = Game.find(params[:id])
        game.update(
            title: params[:title],
            description: params[:description]
        )
    end

    delete '/games/:id' do
        game = Game.find(params[:id])
        game.destroy
    end

## CRUD operations for reviews
    get '/reviews' do
        review = Review.all
        review.to_json
    end

    post '/reviews' do
        review = Review.create(
            comments: params[:comments],
            star_rating: params[:star_rating],
            user_id: params[:user_id],
            game_id: params[:game_id]
        )
        review.to_json
    end

    patch '/reviews/:id' do 
        review = Review.find(params[:id])
        review.update(
            comments: params[:comments],
            star_rating: params[:star_rating]
        )
        review.to_json
    end

    delete '/reviews/:id' do
        review = Review.find(params[:id])
        review.destroy
    end
end