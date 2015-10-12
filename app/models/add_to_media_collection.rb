class AddToMediaCollection

  attr_reader :user, :url, :type

  def initialize(options)
    @user = options.fetch(:user)
    @url = options.fetch(:url)
    @type     = options.fetch(:type)

  end

  def execute!
    MediaRepository.add(user: user, url: url, type: type).tap do |item|
      if item.valid?
        ScrapeTitleJob.perform_later(item.id)
      end
    end
  end

end


