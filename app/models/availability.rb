class Availability < ApplicationRecord
  belongs_to :user

  validates :day, inclusion: { in: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"] }
  validates :time, inclusion: { in: ["Morning", "Afternoon", "Evening"] }

  def self.fill_for_user(user)
    ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].each do |day|
      ["Morning", "Afternoon", "Evening"].each do |time|
        Availability.create!(user: user, day: day, time: time)
      end
    end
  end
end
