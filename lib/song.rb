class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name)
        @name = name
        Song.all << self
    end

    def self.all 
        @@all
    end

    def self.new_by_filename(filename)
        song_arr = filename.split("-").map(&:strip)
        new_song = Song.new(song_arr[1])
        new_song.artist_name = song_arr[0]
        Artist.find_artist(song_arr[0]).add_song(new_song)
        new_song
        #Song.new(song_arr[1]).artist_name = song_arr[0]
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end