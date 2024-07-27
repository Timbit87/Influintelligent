class YoutubeScraper
  def self.extract_youtube_handle(youtube_url)
    youtube_url.split('@').last
  end
  
  def self.get_followers(youtube_url)
    handle = extract_youtube_handle(youtube_url)
    url = "https://socialblade.com/youtube/user/#{handle}"
    doc = Nokogiri::HTML(URI.open(url))

    selector = 'div.YouTubeUserTopInfo:nth-of-type(2) > span#youtube-stats-header-subs'  

    followers_element = doc.at_css(selector)

    if followers_element
      followers_count = followers_element.text.strip
    else
      followers_count = "not found"
    end

    followers_count
  rescue StandardError => e
    "Erro no Youtube para #{youtube_url}: #{e.message}"
  end
end


