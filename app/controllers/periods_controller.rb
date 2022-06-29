class PeriodsController < ApplicationController
  def index
    @periods = Period.all
  end

  def new;end
end
