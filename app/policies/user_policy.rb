class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      user_creator?
    end

    private
    def user_creator?
      record.user == user
    end
  end
end
