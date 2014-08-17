module Api
class OrdersController < ApplicationController
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @orders }
    # end
    render json: @orders.to_json(:include => :products)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    render json: @order.to_json(:include => :products)
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    render json: @order
  end

  # POST /orders
  # POST /orders.json
  def create
    product_ids_list = order_params.delete(:product_id)
    @order = Order.create(order_params.except(:product_id))
    product_ids_list.each do |product_id|
      @order.products << Product.find(product_id.to_i)
    end
    if @order.save
      render json: @order.to_json(:include => :products), status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end


  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    head :no_content
  end

  def order_params
  	params.require(:order).permit(:name, :status, :product_id => [])
  end
end

end