class Api::ProductsController < ApplicationController

  def index

    p "THIS IS BEFORE CURRENT USER"
    p current_user
    p "THIS IS AFTER CURRENT USER"

    # if current_user 
      @products = Product.all 
    # else 
    #   @products = []
    # end
    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      general_use: params[:general_use],
      price: params[:price],
      user_id: current_user.id
    )
    @product.save

    p "*" * 88
    p @product.errors.full_messages
    p "*" * 88
    
    render "show.json.jb"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Product was successfully destroyed"}
  end
end
