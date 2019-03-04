class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def global
    @user.account_type.eql?('warehouse')
  end

  def index?
    global
  end

  def create?
    global
  end

  def show?
    global
  end
end
