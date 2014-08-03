class AnswerSetsController < ApplicationController

  def index
    @answer_sets = AnswerSets.all
  end

end