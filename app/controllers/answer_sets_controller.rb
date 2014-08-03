class AnswerSetsController < ApplicationController

  def index
    @answer_sets = AnswerSet.all
  end

end