class MediaRepository
  def self.add(options)
    MediaItem.create!(options)
  end

  def self.where(*options)
    MediaItem.where(*options)
  end

  def self.visible_for(user)
    MediaItem.where(user: user) + MediaItem.where('user_id != ? AND public = ?', user.id, true)
  end
end
