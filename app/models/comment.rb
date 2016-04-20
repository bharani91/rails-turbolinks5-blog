class Comment < ActiveRecord::Base
  belongs_to :post, touch: true

  validates :post, presence: true
  validates :content, presence: true
end
