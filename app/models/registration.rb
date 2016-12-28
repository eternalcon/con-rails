class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :participant
  
  validates_presence_of :event
  validates_presence_of :participant
  
#  after_commit :send_Welcome_Email
  
#  def send_Welcome_Email
#    RegistrationMailer.Welcome_Email(self).deliver_now #.deliver_later
#  end
end
