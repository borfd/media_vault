class AddToMediaCollection

  attr_reader :user

  def initialize(options)
    @user = options.fetch(:user)
  end

  def execute!(options)
    url = options.fetch(:url)
    type     = options.fetch(:type)

    MediaRepository.add(user: user, url: url, type: type)
  end

end


