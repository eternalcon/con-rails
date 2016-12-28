class Event < ApplicationRecord
  has_many :registrations
  has_many :participants, :through => :registrations
#  has_many :game_blocks, :order => "order_value ASC" 
#  has_many :games, :order => "game_title ASC" 

  has_and_belongs_to_many :prices
  validates_presence_of :name, :startdate, :enddate

  REGISTRATION_IS_AVAILABLE = 10


  def self.active_event
  # Works only if there is just one active event in the database.
  # TODO: make work with multiple events in database
  # either by selecting most recent active event or by automatically inactivating events
  # when finished
    Event.find_by active: "1"
  end
end
