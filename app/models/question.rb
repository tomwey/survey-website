class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true

  validates_presence_of :title, :question_type_id
end
