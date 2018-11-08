class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      profile?
    end

    def index?
      profile?
    end

    def create?
      profile?
    end

    def show?
      profile?
    end

    def destroy?
      user.renter?
    end

    private

    def user_creator?
      record.user == user
    end

    def profile?
      user.owner? || user.renter?
    end

  end
end
