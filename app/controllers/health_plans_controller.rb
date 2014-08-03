class AnswerSetsController < ApplicationController

  def index
   @health_plans = HealthPlan.all
  end

end