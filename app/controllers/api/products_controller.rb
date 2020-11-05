class Api::ProductsController < ApplicationController

  def index
    @products = Product.all 
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
      price: params[:price]
    )
    @product.save
    render "show.json.jb"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Product was successfully destroyed"}
  end
end
