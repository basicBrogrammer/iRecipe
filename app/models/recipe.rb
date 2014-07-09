class Recipe < ActiveRecord::Base
  mount_uploader :meal, MealUploader

  def link
    if document?
      document.url
    else
      self.url
    end
  end
end
