class LinksController < ApplicationController
  def new
    @links = Link.all
  end

  def create
    respond_to do |format|
      @link = Link.new(link_params)
      if @link.save
        format.js
        format.html { redirect_to new_link_path }
      end
    end
  end

  def show
    @link = Link.find_by(token: params[:token])
    @link.times_visited = @link.times_visited + 1
    @link.save
    redirect_to @link.original_url
  end

  private

  def link_params
    params.require(:link).permit(:original_url, :token)
  end
end
