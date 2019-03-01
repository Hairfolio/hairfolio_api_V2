class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.account_type.eql?('warehouse')
  end

  def create?
    @user.account_type.eql?('warehouse')
  end
end
