class FreeformAuthor < ApplicationRecord
  belongs_to :freeform
  validates_presence_of :email
end
