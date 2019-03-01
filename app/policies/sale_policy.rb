class SalePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def pickup?
    record.buyer_email == user.email
  end
end
