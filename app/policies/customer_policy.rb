class CustomerPolicy < ApplicationPolicy
  def index?
    record.user == user
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(user: user)
      end
    end

  end

end
