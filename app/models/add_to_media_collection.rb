

class AddToMediaCollection

  attr_reader :user

  def initialize(options)
    @user = options.fetch(:user)
  end

  def execute!(options)
    item_url = options.fetch(:item_url)
    type     = options.fetch(:type)

    MediaRepository.add(user: user, item_url: item_url, type: type)
  end

end


