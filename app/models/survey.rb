# coding: utf-8
class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :questions, reject_if: lambda { |q| q[:title].blank? }, allow_destroy: true

  validates_presence_of :name, :tagline
  
  def published?
    ! self.published_at.blank?
  end
end