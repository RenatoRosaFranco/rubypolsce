# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @communities = Community.all
  end
end
