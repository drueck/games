class Game < ActiveRecord::Base

  validates :title, presence: true
  validates :bgg_id, presence: true, uniqueness: true

end
