module Audio
  class Player
    def self.play(file_path)
      type = File.extname(file_path).gsub('.', '').upcase
      Audio.const_get(type).new(file_path).play
    end
  end

  class MP4
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def play
      puts "Plaing mp4 by #{file}"
    end
  end

  class MPC
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def play
      puts "Plaing mpc by #{file}"
    end
  end
end

Audio::Player.play('audio.mp4') #Plaing mp4 by audio.mp4
Audio::Player.play('audio.mpc') #Plaing mpc by audio.mpc
