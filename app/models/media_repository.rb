class MediaRepository
  def self.add(options)
    MediaItem.create(options)
  end

  def self.where(*options)
    MediaItem.where(*options)
  end

  def self.visible_for(user)
    if user == MediaBrowse::NoUser
      MediaItem.where(public: true)
    else
      MediaItem.where(user: user) + MediaItem.where('user_id != ? AND public = ?', user.id, true)
    end
  end

  def self.find(*args)
    MediaItem.find(*args)
  end
end
