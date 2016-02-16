class LineItemsController < ApplicationController
	before_action :find_user_and_order

	def index
		@line_items = @order.line_items
	end

	def show
	end

	def new
		@line_item = @order.line_items.new
	end

	def create
		@line_item = @order.line_items.new(line_item_params)

		respond_to do |format|
			if @line_item.save
				format.html { redirect_to user_order_line_items_path(@user, @order), notice: 'User was successfully created.' }
				format.json { render :show, status: :created, location: @line_item }
			else
				format.html { render :new }
				format.json { render json: @line_item.errors, status: :unprocessable_entity }
			end
		end
	end
	
	private

	def line_item_params
      params.require(:line_item).permit(:order_id, :product_id, :quantity)
    end

	def find_user_and_order
		@user = User.find(params[:user_id])
		@order = @user.orders.find(params[:order_id])
	end
end
