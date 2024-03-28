# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def transaction(...)
    ActiveRecord::Base.transaction(...)
  end
end
