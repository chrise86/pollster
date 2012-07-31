class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text, :format
  belongs_to :poll
  has_many :answers
end
