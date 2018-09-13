class Food < ApplicationRecord

  validates :user_id, {presence: true}
  validates :limittype, {presence: true}
  validates :foodtype, {presence: true}
  validates :name, {presence: true}
  validates :amount, {presence: true}
  validates :yetamount, {presence: true}
  validates :image_name, {presence: true}
  validates :amounttype, {presence: true}
  validates :limitday, {presence: true}

end
