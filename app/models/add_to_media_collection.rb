class AddToMediaCollection

  attr_reader :user, :url, :visibility

  def initialize(options)
    @user = options.fetch(:user)
    @url = options.fetch(:url)
    @visibility = options.fetch(:public)
  end

  def execute!
    MediaRepository.add(user: user, url: url, public: visibility).tap do |item|
      if item.valid?
        ScrapeTitleJob.perform_later(item.id)
      end
    end
  end

end


