class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
