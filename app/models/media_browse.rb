class MediaBrowse

  class NoUser; end

  attr_reader :user

  def initialize(options)
    @user = options.fetch(:user, NoUser) || NoUser
  end

  def items
    MediaRepository.visible_for(user)
  end
end
