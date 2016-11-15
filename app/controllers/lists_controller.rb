class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
    @list = List.new
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = List.find(params[:id])
  end

  # GET /lists/new
  def new
    @list = List.new
    # @list.items.build
  end


  def edit
    @list = List.find(params[:id])
  end


  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end


  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :items_attributes => [:description])
    end
end
