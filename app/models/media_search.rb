class MediaSearch
  attr_reader :user

  def initialize(options)
    @user = options.fetch(:user)
  end

  def items
    MediaRepository.visible_for(user)
  end
end
