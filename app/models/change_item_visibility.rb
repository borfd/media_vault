class ChangeItemVisibility

  attr_reader :media_item, :new_visibility

  def initialize(options)
    @media_item = options.fetch(:media_item)
    @new_visibility = options.fetch(:public)
  end

  def execute!
    media_item.public = new_visibility
    media_item.save!
  end

end
