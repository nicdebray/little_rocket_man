class RenterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      user.renter?
    end

    def create?
      user.renter?
    end

    def show?
      user_creator?
    end

    def edit?
      user_creator?
    end

    def update?
      user_creator?

    end

    def destroy?
      user_creator?
    end

    private
    def user_creator?
      record.user == user
    end
  end
end
