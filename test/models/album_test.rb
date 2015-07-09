require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  # test "entry invalid without a title" do
  #   a = Album.new
  #   refute a.vailid?
  # end
 
  test "duplicate entries" do
    a = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    a.save
    z = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    refute z.valid?
  end
 
  test "multiple entries by same artist"
    b = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    a.save
    y = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Brand New Colony', length: 415)
    assert y.valid?
  end
 
  test "validates can be saved and sourced" do
    a = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better', length: 347)
    a.save
    source = Album.find_by(title: 'Nothing Better')
    assert source
  end
 
  test "should have necessary required validators" do
    a = Album.new
    assert_not a.valid?
    asser_equal [:title, :artist, :genre, :length], a.errors.keys
  end
 
  test "invalid without artist" do 
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', length: 347)
    asser_equal a.vailid?, false 
  end
 
  test "invalid without title" do 
    a = Album.new(artist: 'The Postal Service', genre: 'Electronic', length: 347)
    asser_equal a.vailid?, false 
  end
 
  test "invalid without genre" do 
    a = Album.new(artist: 'The Postal Service', title: 'Nothing Better', length: 347)
    asser_equal a.vailid?, false 
  end
 
  test "invalid without length" do 
    a = Album.new(artist: 'The Postal Service', genre: 'Electronic', title: 'Nothing Better')
    asser_equal a.vailid?, false 
  end

  test "length should be numeric" do
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', artist: 123, length: 'string')
    asser_equal a.vailid?, false 
  end

  test "title should NOT be numeric" do
    a = Album.new(title: 123, genre: 'Electronic', artist: 'The Postal Service', length: 347)
    asser_equal a.vailid?, false 
  end

  test "genre should NOT be numeric" do
    a = Album.new(title: 'Nothing Better', genre: 123, artist: 'The Postal Service', length: 347)
    asser_equal a.vailid?, false 
  end
 
  test "artist should NOT be numeric" do
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', artist: 123, length: 347)
    asser_equal a.vailid?, false 
  end
  
  test "length should NOT be blank" do
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', artist: 'The Postal Service', length: '')
    asser_equal a.vailid?, false 
  end
  
  test "title should NOT be blank" do
    a = Album.new(title: '', genre: 'Electronic', artist: 'The Postal Service', length: 347)
    asser_equal a.vailid?, false 
  end
 
  test "genre should NOT be blank" do
    a = Album.new(title: 'Nothing Better', genre: '', artist: 'The Postal Service', length: 347)
    asser_equal a.vailid?, false 
  end
 
  test "artist should NOT be blank" do
    a = Album.new(title: 'Nothing Better', genre: 'Electronic', artist: '', length: 347)
    asser_equal a.vailid?, false 
  end
  
end

  