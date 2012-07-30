class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text
  belongs_to :poll


end
