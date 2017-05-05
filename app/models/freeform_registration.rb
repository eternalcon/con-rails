class FreeformRegistration < ApplicationRecord
  belongs_to :freeform
  has_many :freeform_authors

  validates :freeform, presence: true
  validates :email, uniqueness: { scope: [:freeform_id], message: :unique }
end
