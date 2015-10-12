class PublicMediaItems
  def public
    MediaRepository.where(public: true)
  end
end
