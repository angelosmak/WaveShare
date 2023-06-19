class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def show?
      true
    end

    def edit?
      true
    end

    def update?
      true
    end

    def resolve
      scope.all
      # scope.where(user: user)
    end
  end
end
