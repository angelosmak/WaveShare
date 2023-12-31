class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def show?
      true
    end

    def create?
      true
    end

    def update?
      record.user == user
    end

    def edit?
      record.user == user
    end

    def destroy?
      record.user == user
    end

    def resolve
      scope.all # If users can see all instances
      # scope.where(user: user) # If users can only see their instances
      # scope.where("name LIKE 't%'") # If users can only see instances starting with `t`
      # ...
    end
  end
end
