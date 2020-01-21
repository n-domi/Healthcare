class User < ApplicationRecord
  has_many :records
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  
  def records
    return Record.where(user_id: self.id)
  end
end
