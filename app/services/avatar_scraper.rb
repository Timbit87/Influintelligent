class AvatarScraper
  def self.extract_instagram_handle(instagram_url)
    instagram_url.split('/').last
  end

  def self.get_avatar_url(instagram_url)
    handle = extract_instagram_handle(instagram_url)
    url = "https://socialblade.com/instagram/user/#{handle}"
    doc = Nokogiri::HTML(URI.open(url))

    avatar_selector = 'div#YouTubeUserTopInfoWrap img#YouTubeUserTopInfoAvatar'
    avatar_element = doc.at_css(avatar_selector)

    if avatar_element
      avatar_url = avatar_element['src']
    else
      avatar_url = ActionController::Base.helpers.asset_path('user-photo.png')
    end

    avatar_url
  rescue StandardError => e
    ActionController::Base.helpers.asset_path('user-photo.png')
  end
end