class Recipe < ActiveRecord::Base
  acts_as_taggable
  mount_uploader :meal, MealUploader

  has_many :ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true

  has_many :steps
  accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true

  def link
    if document?
      document.url
    else
      self.url
    end
  end
end
