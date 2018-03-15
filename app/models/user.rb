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
  after_create :fill_availabilities

  mount_uploader :photo, PhotoUploader

  def fill_availabilities
    Availability.fill_for_user(self)
  end

  def user_matches_number
    number = 0
    number += requester_matches.size unless requester_matches.nil?
    number += approver_matches.size unless approver_matches.nil?
  end

  def shared_courts(user)
    my_courts = Court.near(address, radius)
    opponent_courts = Court.near(user.address, user.radius)
    my_courts.select do |court|
      opponent_courts.include?(court)
    end
  end

  def shared_availabilities(user)
    opponent_availabilities = user.availabilities

    availabilities.select do |availability|
      opponent_availabilities.any? do |opponent_availability|
        opponent_availability.available &&
        availability.available &&
        opponent_availability.time == availability.time &&
        opponent_availability.day == availability.day
      end
    end.pluck(:day, :time).map do |pair|
      pair.join(" ")
    end
  end

  def can_play_with?(user)
    shared_courts(user).any? && shared_availabilities(user).any?
  end

  #return an arrays of matches where I am the approver
  def approver_matches
    Match.where(approver: self)
  end

  #return an arrays of matches where I am the requester
  def requester_matches
    Match.where(requester: self)
  end

  def my_matches
    Match.where('requester_id = ? OR approver_id = ?', self.id, self.id).order(id: :desc)
  end

