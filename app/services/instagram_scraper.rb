class InstagramScraper
  def self.get_followers(username)
    url = "https://www.instagram.com/#{username}/"
    doc = Nokogiri::HTML(URI.open(url))
    followers = doc.at_css('meta[name="description"]').attributes['content'].value.split(' ').first
    followers
  end
end
