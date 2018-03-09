class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def create?
    true
  end

  def show?
    record.requester == user || record.approver == user
  end

  def update?
    record.approver == user
  end

end
