class Role < ApplicationRecord
  has_and_belongs_to_many :users
  # Roles are supposed to be stored in the database as CamelCased names.
  # TODO: add a validation for role name format.
end
