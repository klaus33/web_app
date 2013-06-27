class Answer < ActiveRecord::Base
  attr_accessible :content, :correct, :question_id, :user_id, :vote
  belongs_to :question
  belongs_to :user
  validates :user_id, presence: true
  validates :question_id, presence: true
end
