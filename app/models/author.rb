class Author < ApplicationRecord
  validates :last_name, :formatted_name, presence: true
end