class SearchPolicy < Struct.new(:user, :search)
  def index?
    true
  end
end
