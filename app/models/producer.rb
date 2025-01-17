class Producer < ApplicationRecord
  self.abstract_class = true

  validates_presence_of(:name)

  # TODO: add validations
end
