class MainController < ApplicationController

  def index

  end

  def questions_1
    @answer_set = AnswerSet.new
  end

  def post_answers_1
    # save information

    #redirect to "questions_2"
    redirect_to action: 'questions_2'
  end

  def questions_2

  end

  def post_answers_2
    # save information

    #redirect to "recommendations"
    redirect_to action: 'questions_3'
  end

  def questions_3
    @answer_set = AnswerSet.new
  end

  def post_answers_3
    # save information

    #redirect to "questions_2"
    redirect_to action: 'questions_4'
  end

  def questions_4
    @answer_set = AnswerSet.new
  end

  def post_answers_4
    # save information

    #redirect to "questions_2"
    redirect_to action: 'questions_5'
  end

  def questions_5
    @answer_set = AnswerSet.new
  end

  def post_answers_5
    # save information

    #redirect to "questions_2"
    redirect_to action: 'questions_6'
  end

    def questions_6
    @answer_set = AnswerSet.new
  end

  def post_answers_6
    # save information

    #redirect to "questions_2"
      redirect_to action: 'recommendations'
  end


  def recommendations
    @health_plans = HealthPlan.all
  end


end