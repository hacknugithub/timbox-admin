class Post
  include ActiveModel::Model

  attr_accessor :userId, :id, :title, :body

  def persisted?
    id.present?
  end
end