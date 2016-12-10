class FoodStoresController < ApplicationController
  before_action :run_of_the_mill_authentication

  def index
    @food_stores = FoodStore.where(user_id: current_user)
  end

  def show
    @food_store = FoodStore.find(params[:id])
    @food_items = @food_store.food_items
  end

  def create
    @food_store = FoodStore.new(food_store_params)
    @food_store.user_id = current_user.id
    if @food_store.save!
      flash[:notice] = "Success!"
      redirect_to action: :index
    else
      flash[:errors] = @food_store.errors.full_messages.join
      redirect_to :back
    end
  end

  def destroy
    @food_store = FoodStore.find(params[:id])
    if @food_store.user == current_user
      if @food_store.destroy!
        flash[:notice] = "Success!"
      else
        flash[:errors] = @food_store.errors.full_messages.join
      end
    else
      flash[:errors] = "Could not delete."
    end
    redirect_to :back
  end

  private

  def food_store_params
    params.require(:food_stores).permit(:name)
  end
end
