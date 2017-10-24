class SellersController < ApplicationController

  def create
     @shoe = Shoe.find(params[:id])
     @shoe.user_sellers << current_user
     @shoe.save
     redirect_to shoes_path
   end

   def destroy
     @shoe = Shoe.find(params[:id])
     @shoe.user_sellers.delete(User.find(current_user.id))
     redirect_to shoes_path
   end
 end
