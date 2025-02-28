class ListsController < ApplicationController
before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def show
    @bookmarks = @list.bookmarks

  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_path
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :image_url)
  end

end
