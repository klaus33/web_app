class Pregunta < ActiveRecord::Base
  attr_accessible  :content, :tags
  belongs_to :user 
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  default_scope order: 'pregunta.created_at DESC'
end
