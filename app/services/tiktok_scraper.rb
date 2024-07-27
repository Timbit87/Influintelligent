class TiktokScraper
  def self.extract_tiktok_handle(tiktok_url)
    tiktok_url.split('@').last
  end
  
  def self.get_followers(tiktok_url)
    handle = extract_tiktok_handle(tiktok_url)
    url = "https://socialblade.com/tiktok/user/#{handle}"
    doc = Nokogiri::HTML(URI.open(url))

    selector = 'div.YouTubeUserTopInfo:nth-of-type(2) > span[style="font-weight: bold;"]'

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
