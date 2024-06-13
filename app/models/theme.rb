# frozen_string_literal: true

# Theme model
# A Theme is a set of Events that will be displayed to the players
class Theme < ApplicationRecord
  has_and_belongs_to_many :events
end
