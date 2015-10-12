class MediaRepository
  def self.add(options)
    MediaItem.create!(options)
  end

  def self.where(options)
    MediaItem.where(options)
  end
end
