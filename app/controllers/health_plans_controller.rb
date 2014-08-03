class AnswerSetsController < ApplicationController

  def index
   @health_plans = HealthPlans.all
  end

end