class Poll < ActiveRecord::Base
  attr_accessible :name
  before_save :set_edit_slug
  has_many :questions
  has_many :answers, :through => :questions
  validates :name, :presence => true

  def set_edit_slug
    self.edit_slug ||= random_string
  end


  def random_string
    string = (0..25).map{97.+(rand(25)).chr}.join
  end



end
