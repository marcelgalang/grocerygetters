class ItemsController < ApplicationController
  # before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end


  def show
  end

  def new
    @item = Item.new
  end


  def edit
  end


  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to list_path(@item.list)
  end


  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:description, :status, :list_id)
    end
end
