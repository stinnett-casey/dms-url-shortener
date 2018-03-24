class Link < ApplicationRecord
  require 'securerandom'
  has_many :clicks, dependent: :destroy

  before_create :gen_token

  private

  def gen_token
    new_token = SecureRandom.hex(3)
    links_with_token = Link.where(token: new_token)

    while links_with_token.count > 0 # make sure not to use the same token!
      new_token = SecureRandom.hex(3)
      links_with_token = Link.where(token: new_token)
    end
    
    self.token = new_token
  end

  def self.most_popular(from_date)
    # return the count hash for each link
    click_count = Click.where(created_at: from_date.beginning_of_day..DateTime.now.end_of_day).group(:link_id).count
    # click_count looks like: {2=>3, 3=>1}
    # sort by count and then reverse to be greatest to smallest and turn back into a Hash
    Hash[click_count.sort_by { |link_id| link_id[1] }.reverse]
  end
end
