class UsersController < ApplicationController

    before_action :authenticate_user!
    def add
        @user = current_user
    end

    def update
    @user = current_user

    amount = params[:amount].to_i

    if amount > 0
      # Ajoute la valeur à la balance de l'user
      @user.balance += amount

      if @user.save
        flash[:success] = "Ajout de #{amount} à la balance réussi."
      else
        flash[:error] = "Erreur lors de la mise à jour de la balance."
      end
    else
      flash[:error] = "La valeur doit être supérieure à zéro."
    end

    # Retour
    redirect_to root_path
  
    end

    def mypokemons
        @user_pokemons = current_user.pokemons
    end


end
