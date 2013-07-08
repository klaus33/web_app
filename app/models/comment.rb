class Comment < ActiveRecord::Base
  attr_accessible :answer_id, :content
  belongs_to :answer
  validates :answer_id, presence: true
end

