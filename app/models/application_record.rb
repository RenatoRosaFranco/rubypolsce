# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def transaction(&block)
    ActiveRecord::Base.transaction do
      yield block if block_given?
    end
  end
end
