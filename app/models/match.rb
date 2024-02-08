# Match : Backgammon match model
class Match < ApplicationRecord
  enum :status, %i[scheduled playing finished], prefix: true, scopes: false
  belongs_to :author, class_name: 'User'
end
