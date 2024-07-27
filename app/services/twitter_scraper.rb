class TwitterScraper
  def self.get_followers(username)
    url= "https://socialblade.com/twitter/user/#{username}"
    doc = Nokogiri::HTML(URI.open(url))

    selector = 'div.YouTubeUserTopInfo > span[style="font-weight: bold;"]'

    followers_element = doc.at_css(selector)
      followers_count = followers_element.text.strip

    followers_count
  rescue StandardError => e
    "Twitter error for #{username}: #{e.message}"
  end
end




