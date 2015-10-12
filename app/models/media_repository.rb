class MediaRepository
  def self.add(options)
    MediaItem.create!(options)
  end
end
