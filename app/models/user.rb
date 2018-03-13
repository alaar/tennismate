class User < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_attributes,
    against: [ :last_name, :first_name, :skill_level, :gender],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :global_search,
    against: [ :last_name, :first_name, :skill_level, :gender ],
    associated_against: {
      availability: [ :day, :time ]
    },
    using: {
      tsearch: { prefix: true }
    }

  has_many :availabilities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :gender, inclusion: { in: ["female", "male", "other"] }
  validates :skill_level, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  def shared_courts(user)
    my_courts = Court.near(address, radius)
    opponent_courts = Court.near(user.address, user.radius)
    my_courts.select do |court|
      opponent_courts.include?(court)
    end
  end

  def approver_matches
    Match.where(approver: self)
  end

  def requester_matches
    Match.where(requester: self)
  end
end
