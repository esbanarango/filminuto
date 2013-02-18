module Attachment::Video

  extend ActiveSupport::Concern

  included do
    has_attached_file :file,
      :url => "/assets/videos/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/videos/:id/:style/:basename.:extension",
      :styles => lambda { |video| {
              :mp4 => { :format => 'mp4', :convert_options => { :output => { 
                          vf: video.instance.rotate, t: '60' } } },
              :ogg => { :format => 'ogg', :convert_options => { :output => { 
                          vcodec: 'libtheora', b: '512k', bt: '100k', 
                          acodec: 'libvorbis', ab: '112k', ac: 2, 
                          vf: video.instance.rotate, t: '60' } } },
              :webm => { :format => 'webm', :convert_options => { :output => { 
                          acodec: 'libvorbis', vcodec: 'libvpx',
                          vf: video.instance.rotate, t: '60' } } },                          
              :thumb => { :geometry => "520x390#", :format => 'jpg', :time => 1, :convert_options => { :output => { 
                         vf: video.instance.rotate
                         } } }
                    }
                  },
      :processors => [:ffmpeg]
  end

  module InstanceMethods
    # Method to know if the video needs to be rotated.
    def rotate
      if file.queued_for_write[:original]
        path = file.queued_for_write[:original].path
        rotation = MiniExiftool.new(path).rotation
        return "transpose=1" if rotation == 90
        return "transpose=2" if rotation == 270
        return "vflip,hflip" if rotation == 180
      end
    end
  end

end