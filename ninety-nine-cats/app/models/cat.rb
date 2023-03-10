# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

CAT_COLOR = ["black", "gray", "orange", "spotted"]
class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: CAT_COLOR }
  validates :sex, inclusion: {in: ["M", "F"]}
  
  validate :birth_date_cannot_be_future
  
  def birth_date_cannot_be_future
    if birth_date > Date.today
      errors.add(:birth_date, "can't be in the future")
    end
  end

  def age
    age = Date.today.year - birth_date.year
    age -= 1 if Date.today < birth_date.month + age.years
    age
  end

end
