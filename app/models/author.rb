class Author < ApplicationRecord
  validates :first_name, :last_name, :formatted_name, presence: true
end