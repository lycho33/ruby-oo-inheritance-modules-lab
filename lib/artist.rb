require 'pry'

class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods 
  extend Findable
  include Paramable

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super #will tell that method to look up its behavior in the method of the same name that lives in the parent, or super, class. 
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
