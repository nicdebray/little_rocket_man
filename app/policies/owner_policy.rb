class OwnerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      user.owner?
    end

    def create?
      user.owner?
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
