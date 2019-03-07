module Errors
  class QuantityExceedError < Exception
    def message
      I18n.t('exceptions.cart_empty_error')
    end
  end
end