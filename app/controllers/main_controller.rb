class MainController < ApplicationController

  def index

  end

  def questions_1
    @answer_set = AnswerSet.new
  end

  def post_answers1

  end

  def questions_2

  end

  def recommendations
    @health_plans = HealthPlan.all
  end


end