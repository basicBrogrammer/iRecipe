class Recipe < ActiveRecord::Base
  acts_as_taggable
  mount_uploader :meal, MealUploader

  def link
    if document?
      document.url
    else
      self.url
    end
  end
end
