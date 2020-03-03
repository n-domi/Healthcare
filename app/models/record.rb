class Record < ApplicationRecord
  belongs_to :user
  has_many :goodfeeling, dependent: :destroy
  has_many :badfeeling, dependent: :destroy
  
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

end
