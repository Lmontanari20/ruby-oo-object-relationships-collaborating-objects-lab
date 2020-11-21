class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        files = Dir[path + "/*.mp3"]
        files_aa = files.map {|file| file.split("/")}
        files_aa.map{|file_array| file_array[file_array.length - 1]}
    end 

    def import 
        self.files.each {|file| Song.new_by_filename(file)}
    end
end