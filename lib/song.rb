require "pry"

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save 
    return song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
song = self.new
song.name = name
return song

  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    return song

  end

  def self.find_by_name(name)
 self.all.find{| song | song.name == name}
  end

def self.find_or_create_by_name(name)
self.create_by_name(name)
self.find_by_name(name)
end

def self.alphabetical
  self.all.sort_by{|song| song.name}
end

def self.new_from_filename(song)
    data = song.split(" - ")
    artist_name = data[0]
    song_name = data[1].sub! ".mp3", ""

  new_song = self.new
  new_song.name = song_name
  new_song.artist_name = artist_name

  new_song
  end
 
def self.create_from_filename(new_add)
new_song = self.new_from_filename(new_add)
new_song.save

end

def self.destroy_all
@@all.clear
end

end
