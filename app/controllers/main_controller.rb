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
    puts params['zip_code']
    puts params['gender']
    puts params['scope']
    puts params['marital_status']

    # save information
    id = params['id']
    answer_set = AnswerSet.find(id)
    answer_set['gender'] = params['gender']
    answer_set['marital_status'] = params['marital_status']
    answer_set['age'] = params['age']
    answer_set['zip_code'] = 'Florida'
    answer_set['scope'] = params['scope']
    answer_set.save()

    #redirect to "questions_2"
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
    answer_set.save()
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
    answer_set.save()

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
    answer_set.save()

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
    id = params['id']
    @answer_set = AnswerSet.find(id)

    @age = @answer_set['age']
    @age = 30 if @age == nil
    @marital_status = @answer_set['marital_status']
    @preferred_doctor = @answer_set['preferred_doctor']
    @number_of_visits = @answer_set['number_of_visits']
    @number_of_prescription_drugs = @answer_set['number_of_prescription_drugs']

    @all_health_plans = HealthPlan.all
    first_plan = @all_health_plans[0]

    @premium = first_plan['premium_adult_individual_age_27']
    if (@age > 27)
      @premium = first_plan['premium_adult_individual_age_50']
    end
    if (@marital_status == 'married')
      @premium = first_plan['premium_family_age_30']
    end

    # find the qualified plans
    @qualified_health_plans = []
    for health_plan in @all_health_plans do
      plan_type = health_plan['plan_type']

      if health_plan['rating_area'] == 'Rating Area 8'
        if @preferred_doctor
          if plan_type == 'HMO'
            @qualified_health_plans.append(health_plan)
          end
        else
          @qualified_health_plans.append(health_plan)
        end
      end
    end

    # score the qualified plans
    temp_score_tuples = []
    for health_plan in @qualified_health_plans do
      @premium = health_plan['premium_adult_individual_age_27']
      if (@age > 27)
        @premium = health_plan['premium_adult_individual_age_50']
      end
      if (@marital_status == 'married')
        @premium = health_plan['premium_family_age_30']
      end

      annual_premium = 12.0 * @premium
      medical_max_OOP = health_plan.medical_deductable_individual_in_network
      drugs_max_OOP = health_plan.drug_deductable_individual_in_network

      if (@marital_status == 'married')
        medical_max_OOP = health_plan.medical_deductable_family_in_network
        drugs_max_OOP = health_plan.drug_deductable_family_in_network
      end
      medical_max_OOP = 0.0 if medical_max_OOP == nil
      drugs_max_OOP = 0.0 if drugs_max_OOP == nil

      medical_max_OOP_factor = 0.5 + (0.5 * @number_of_visits / 4.0)
      drugs_max_OOP_factor = 0.5 + (0.5 * @number_of_prescription_drugs / 2.0)

      total_cost = annual_premium + medical_max_OOP*medical_max_OOP_factor + drugs_max_OOP*drugs_max_OOP_factor
      score_tuple = [total_cost, health_plan]
      temp_score_tuples.append(score_tuple)
    end

    # sort it
    temp_score_tuples.sort! { |a, b| a[0] <=> b[0] }

    @score_tuples = []
    for score_tuple in temp_score_tuples do
      @score_tuples.append(score_tuple) if @score_tuples.length < 6
    end
  end
end