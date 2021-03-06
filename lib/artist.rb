
class Artist
  extend Concerns::Findable
  extend Concerns::Save::ClassMethods
  include Concerns::Save::InstanceMethods
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  end
end
