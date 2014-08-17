module Api
class ProductsController < ApplicationController
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    if params[:page].nil?
      page = 1
    else
      page = params[:page]
    end
    first = (page.to_i - 1) * 10
    last = first + 9
    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @products }
    # end
    render json: @products[first..last]
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    render json: @product
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    render json: @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end


  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    head :no_content
  end

  def product_params
  	params.require(:product).permit(:name, :price, :status)
  end
end

end