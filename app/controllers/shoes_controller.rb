class ShoesController < ApplicationController

  def index
      @shoes = Shoe.all
      @buyer = Buyer.all
    end

    def show
      @user = User.find(params[:id])
      @shoes = Shoe.all
      @buyer = Buyer.all
    end

    def create
      @shoe = Shoe.new(name:shoe_helper[:name],price:shoe_helper[:price], user:current_user)
      @shoe.user_sellers << current_user
      if @shoe.save
        redirect_to shoes_path
      else
        flash[:errors] = @shoe.errors.full_messages
        redirect_to shoes_path
      end
    end

    def buy
      @shoe = Shoe.find(params[:id])
      @shoe.user_buyers << current_user
      @shoe.save
      redirect_to "/shoes/#{ current_user.id }"
    end


    def destroy
      @shoe = Shoe.find(params[:id])
      if current_user.id == @shoe.user.id
        @shoe.destroy
        redirect_to "/shoes/#{ current_user.id }"
      else
        flash[:errors] = ["Only the seller can delete a shoe!"]
        redirect_to shoes_path
      end
    end

    private

    def shoe_helper
      params.require(:shoe).permit(:name,:price) if params[:shoe].present?
    end
  end
