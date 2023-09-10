class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all
    end

    def show
        @pokemon = Pokemon.find(params[:id])
    end

    def buy
        @pokemon = Pokemon.find(params[:id]) # Trouver le Pokémon à acheter
        @user = current_user # Récupérer l'utilisateur actuellement connecté
        @previous_owner_id = @pokemon.user_id
        
        # L'utilisateur a suffisamment d'argent
        @user.balance -= @pokemon.price
        @pokemon.user_id = @user.id
        @user.save
        @pokemon.save
        flash[:success] = "Félicitations ! Vous avez acheté #{@pokemon.name}"



        Transaction.create!(
            user_id: @user.id,
            previous_owner_id: @previous_owner_id, # Remplacez par le nom de l'ancien propriétaire
            pokemon_id: @pokemon.id
          )
    

        redirect_to pokemons_path # Rediriger vers la liste des Pokémon
    end
end
