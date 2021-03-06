class LinksController < ApplicationController
  def new
    @links = Link.all
  end

  def create
    respond_to do |format|
      @link = Link.new(link_params)
      if @link.save
        format.js # views/links/create.js.erb
        # not actually using
        # format.html { redirect_to new_link_path }
      end
    end
  end

  # find the link by the token, increment visited count, and create a click record for it.
  def show
    @link = Link.find_by(token: params[:token])
    @link.times_visited = @link.times_visited + 1
    @link.save
    Click.create(link: @link) # for reporting on most popular
    redirect_to @link.original_url
  end

  private

  def link_params
    params.require(:link).permit(:original_url, :token)
  end
end
