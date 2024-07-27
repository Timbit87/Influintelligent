class TiktokScraper
  def self.get_followers(tiktok_url)
    doc = Nokogiri::HTML(URI.open(tiktok_url))

    selector = 'div.YouTubeUserTopInfo span[style="font-weight: bold;"]'

    followers_element = doc.at_css(selector)

    if followers_element
      followers_count = followers_element.text.strip
    else
      followers_count = "not found"
    end

    followers_count
  rescue StandardError => e
    "Erro no TikTok para #{tiktok_url}: #{e.message}"
  end
end
