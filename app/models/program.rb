class Program < ApplicationRecord
  validates :code, :name, presence: true
end
