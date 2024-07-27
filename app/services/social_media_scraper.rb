class SocialMediaScraper
  def self.get_followers(platform, identifier)
    case platform
    when 'instagram'
      InstagramScraper.get_followers(identifier)
    when 'twitter'
      TwitterScraper.get_followers(identifier)
    when 'tiktok'
      TiktokScraper.get_followers("https://www.tiktok.com/@#{identifier}")
    when 'youtube'
      YoutubeScraper.get_followers(identifier)
    else
      raise "Unsupported platform: #{platform}"
    end
  end
end
