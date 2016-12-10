class FoodItemsController < ApplicationController
  before_action :run_of_the_mill_authentication

  def create
    @food_item = FoodItem.new(food_item_params)
    @food_item.food_store_id = params[:food_store_id]
    if @food_item.save!
      flash[:notice] = "Success!"
      redirect_to :back
    else
      flash[:errors] = @food_store.errors.full_messages.join
    end
  end

  def edit
    @food_item = FoodStoreItem.find(params[:id])
    if @food_item.update(user_params)
      flash[:notice] = "Succesfully updated"
      redirect_to food_store_path(@food_item.food_store)
    else
      flash[:errors] = "Something went wrong"
      redirect_to :back
    end
  end

  def destroy
    @food_item = FoodItem.find(params[:id])
    if @food_item.food_store.user_id == current_user.id
      if @food_item.destroy!
        flash[:notice] = "Success!"
      else
        flash[:errors] = @food_item.errors.full_messages.join
      end
    else
      flash[:errors] = "Could not delete item."
    end
    redirect_to :back
  end

  private

  def food_item_params
    params.require(:food_item).permit(:name, :expiration_date, :entry_date)
  end
end
