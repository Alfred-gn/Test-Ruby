class Document < ApplicationRecord

  validates :url, presence: true
  validates :nbresa, presence: true
  validates :nbbuyers, presence: true
  validates :buyersage, presence: true
  validates :resaprice, presence: true
end
