class Match < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: "requester_id"
  belongs_to :approver, class_name: "User", foreign_key: "approver_id"

  belongs_to :court
  belongs_to :availability, optional: true
end
