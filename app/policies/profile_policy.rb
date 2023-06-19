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
<<<<<<< HEAD
      true
    end

    def update?
      true
=======
      update?
    end

    def update?
      record.user == user
>>>>>>> master
    end

    def resolve
      scope.all
      # scope.where(user: user)
    end
  end
end
