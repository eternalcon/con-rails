class ProgramItem < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :title, presence: true
  validates :description_en, presence: { :unless => :description_de? }
  validates :description_de, presence: {:unless => :description_en? }
  validates :min_player_count, numericality: { :greater_than => 0 }
  validates :max_player_count, numericality: { :greater_than => 0 }
  validates :min_age, numericality: { :greater_than => 0 }
end
