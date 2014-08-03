class MainController < ApplicationController

  def index
    @answer_set = AnswerSet.new
    @answer_set.save()
  end

  def questions_1
    id = params['id']
    @answer_set = AnswerSet.find(id)
  end

  def post_answers_1
    puts params['id']
    puts params['age']
    puts params['zipcode']
    puts params['gender']
    puts params['scope']
    puts params['marital_status']

    # save information
    id = params['id']
    answer_set = AnswerSet.find(id)
    answer_set['gender'] = params['gender']
    answer_set['marital_status'] = params['marital_status']
    answer_set['age'] = params['age']
    answer_set['scope'] = params['scope']
    answer_set.save()

    redirect_to action: 'questions_2', id: id
  end

  def questions_2
    id = params['id']
    puts "questions 2"
    puts id
    @answer_set = AnswerSet.find(id)
  end

  def post_answers_2
    puts params['id']
    puts params['household_income']

    # save information
    id = params['id']
    answer_set = AnswerSet.find(id)
    answer_set['household_income'] = params['household_income']
    answer_set.save()

    #redirect to "questions 3"
    redirect_to action: 'questions_3', id: id
  end

  def questions_3
    id = params['id']
    puts "questions 3"
    puts id
    @answer_set = AnswerSet.find(id)
  end

  def post_answers_3
    # save information
    puts params['preferred_doctor']
    puts params['number_of_prescription_drugs']

    id = params['id']
    answer_set = AnswerSet.find(id)
    answer_set['preferred_doctor'] = (params['preferred_doctor'] == "1")
    answer_set['number_of_prescription_drugs'] = params['number_of_prescription_drugs']

    #redirect to "questions 4"
    redirect_to action: 'questions_4', id: id
  end

  def questions_4
    id = params['id']
    puts "questions 4"
    puts id
    @answer_set = AnswerSet.find(id)
  end

  def post_answers_4
    # save information
    puts params["number_of_visits"]
    puts params["illness"]

    #save questions
    id = params['id']
    answer_set = AnswerSet.find(id)
    answer_set['illness'] = (params['illness'] == "1")
    answer_set['number_of_visits'] = params['number_of_visits']

    #redirect to "questions 5"
    redirect_to action: 'questions_5', id: id
  end

  def questions_5
    id = params['id']
    puts "questions 5"
    puts id
    @answer_set = AnswerSet.find(id)
  end

  def post_answers_5
    puts params["procedure_planned"]
    puts params['smoker']

    # save information
    id = params['id']
    answer_set = AnswerSet.find(id)
    answer_set['procedure_planned'] = (params['procedure_planned'] == "1")
    answer_set['smoker'] = params['smoker']

    #redirect to "questions 5"
    redirect_to action: 'questions_6', id: id
  end

  def questions_6
    id = params['id']
    puts "questions 6"
    puts id
    @answer_set = AnswerSet.find(id)
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