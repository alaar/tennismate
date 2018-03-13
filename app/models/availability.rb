class Availability < ApplicationRecord
  belongs_to :user

  validates :day, inclusion: { in: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"] }
  validates :time, inclusion: { in: ["Morning", "Afternoon", "Evening"] }
end
l
