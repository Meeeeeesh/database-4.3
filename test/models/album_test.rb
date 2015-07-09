require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "duplicate entries" do
    Album.create!(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    z = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    refute z.valid?
  end
 
  test "can create multiple entries by same artist" do
    Album.create!(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    y = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Brand New Colony', length: 415)
    assert y.valid?
  end
 
  test "validates can be saved and sourced" do
    Album.create!(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    source = Album.find_by(title: 'Nothing Better')
    assert source.present?
  end
 
  test "should have necessary required validators" do
    a = Album.new
    refute a.valid?
    [:title, :artist, :genre, :length].each do |key|
      assert a.errors.keys.include?(key)
    end
  end
 
  test "invalid without artist" do 
    a = Album.new(artist: '', title: 'Nothing Better', genre: 'Electronic', length: 347)
    refute a.valid? 
  end
 
  test "invalid without title" do 
    a = Album.new(artist: 'The Postal Service', title: '', genre: 'Electronic', length: 347)
    refute a.valid? 
  end
 
  test "invalid without genre" do 
    a = Album.new(artist: 'The Postal Service', title: 'Nothing Better', genre: '', length: 347)
    refute a.valid? 
  end
 
  test "invalid without length" do 
    a = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: '')
    refute a.valid?  
  end

  test "length should be numeric" do
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', artist: 123, length: 'string')
    refute a.valid?  
  end
  
  test "length should NOT be blank" do
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', artist: 'The Postal Service', length: '')
    refute a.valid?
    assert a.errors.keys.include?(:length), 'What is this?!'
  end
  
  test "title should NOT be blank" do
    a = Album.new(title: '', genre: 'Electronic', artist: 'The Postal Service', length: 347)
    refute a.valid?  
  end
 
  test "genre should NOT be blank" do
    a = Album.new(title: 'Nothing Better', genre: '', artist: 'The Postal Service', length: 347)
    refute a.valid?  
  end
 
  test "artist should NOT be blank" do
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', artist: '', length: 347)
    refute a.valid?  
  end
  
end

  