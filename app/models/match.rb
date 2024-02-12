# Match : Backgammon match model
class Match < ApplicationRecord
  belongs_to :author, class_name: 'User'
  enum :status, %i[scheduled playing finished], prefix: true, scopes: false
  validates :datetime, presence: true
end
