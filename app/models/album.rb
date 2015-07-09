class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :length, presence: true
  validates :length, numerically: { greater_than: 0 }
  validates :length, numerically: true
  validates :length, numerically: { only_integer: true }
  validates :length, length: ( minimum: 1 )
  validates_uniqueness_of :title { scope: :artist }
  validates_length_of :title, length: ( minimum: 1 )
end
