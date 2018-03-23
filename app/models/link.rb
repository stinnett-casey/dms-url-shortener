class Link < ApplicationRecord
  require 'securerandom'

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
end
