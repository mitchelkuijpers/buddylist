module VideoPostsHelper

  def determine_video_resource video_url
    # example video_url: http://www.youtube.com
    if video_url.match /^https?:\/\/(www\.)?youtube\.com/i
      _link = video_url.gsub /watch\?v=/, 'embed/'
      return _link.gsub /&[a-zA-Z0-9]/, ''
    elsif video_url.match /^https?:\/\/(www\.)?vimeo\.com/i
      # vimeo
    end

  end

  def get_code_video video_url
     return video_url.gsub /http:\/\/www.youtube.com\/watch\?v=([a-z0-9])&/i, '\\1'
  end

end