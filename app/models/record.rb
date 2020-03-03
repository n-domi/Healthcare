class Record < ApplicationRecord
  belongs_to :use
  h
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  
  def user
    return User.find_by(id: self.user_id)
  end

end
