class MediaRepository
  def self.add(options)
    MediaItem.create!(options)
  end

  def self.where(*options)
    MediaItem.where(*options)
  end

  def self.visible_for(user)
    MediaItem.where('user_id = ? OR public = ?', user.id, true).distinct
  end
end
