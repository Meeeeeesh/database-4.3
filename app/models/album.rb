class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :length, presence: true
  validates :length, numericality: { greater_than: 0, only_integer: true }
  validates :title, uniqueness: { scope: :artist }
end
