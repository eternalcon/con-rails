class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :event_registrations
  has_many :participants, through: :event_registrations
  has_many :program_items
  #has_one :participant #, :inverse_of => :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_format_of :email,:with => Devise::email_regexp
         
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
