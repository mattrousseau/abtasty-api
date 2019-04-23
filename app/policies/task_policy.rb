class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user == user
  end

  def destroy?
    create?
  end

  def update?
    create?
  end

  def my_weekly_tasks?
    true
  end
end
