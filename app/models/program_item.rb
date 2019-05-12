class ProgramItem < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :title, presence: true
  validates :description_en, presence: true, unless: :description_de
  validates :description_de, presence: true, unless: :description_en
  
end
