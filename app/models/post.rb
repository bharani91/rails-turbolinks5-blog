class Post < ActiveRecord::Base
  paginates_per 10

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  default_scope { order("created_at DESC") }

  def extract
    content.to_s.truncate_words(10, omission: '... (Read more)')
  end
end
