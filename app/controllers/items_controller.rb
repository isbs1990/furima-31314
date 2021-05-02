class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show] 
  before_action :item_for_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item=Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def update
  #   if @item.update(item_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @item.destroy
  #   redirect_to root_path
  # end

  def show
  end

  # def edit
  # end

  # private

  # def move_to_index
  #   redirect_to action: :index if current_user.id != @item.user_id || @item.order.present?
  # end

  def item_params
    params.require(:item).permit(:name, :description , :detailcategory_id , :detailstatus_id , :deliverycost_id , :pref_id , :deliveryday_id , :price ,:image).merge(user_id: current_user.id)
  end

  def item_for_params
    @item = Item.find(params[:id])
  end
end
