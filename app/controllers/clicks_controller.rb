class ClicksController < ApplicationController
  def index
  end

  def popular
    time_ago = DateTime.now-(params[:time_period].to_i).days
    @popular_links_counts = Link.most_popular(time_ago)
    data = {labels: [], datasets: [{data: [], labels: [], backgroundColor: ['rgb(237,4,34,.5)', 'rgb(255,161,3,.5)', 'rgb(0,189,74,.5)', 'rgb(170,226,32,.5)']}], options: {responsive: false}}
    # at most, 4
    times_to_loop = @popular_links_counts.count > 4 ? 4 : @popular_links_counts.count
    (0...times_to_loop).each do |i|
      link_id = @popular_links_counts.keys[i]
      link_click_count = @popular_links_counts[link_id]
      link = Link.find(link_id)

      data[:datasets][0][:data].push(link_click_count)
      data[:datasets][0][:labels].push(link.original_url)
      data[:labels].push('/' + link.token)
    end
    respond_to do |format|
      format.json { render json: {data: data} }
    end
  end
end
