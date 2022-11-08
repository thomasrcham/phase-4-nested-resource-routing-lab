class ItemsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    user = User.find(params[:user_id])
    item =
      user.items.create(
        name: params[:name],
        description: params[:description],
        price: params[:price]
      )
    render json: item, status: :created
  end
end
