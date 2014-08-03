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
    puts params['scope']
    puts params['smoker']

    # save information
    id = params['id']
    answer_set = AnswerSet.find(id)
    answer_set['gender'] = params['gender']
    answer_set['marital_status'] = params['marital_status']
    answer_set['age'] = params['age']
    answer_set['scope'] = params['scope']
    answer_set['smoker'] = params['smoker']
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
    # save information
    id = params['id']

    answer_set = AnswerSet.find(id)
    answer_set['preferred_doctor'] = (params['preferred_doctor'] == "1")
    answer_set['procedure_planned'] = (params['procedure_planned'] == "1")
    answer_set['household_income'] = params['household_income']
    answer_set['illness'] = (params['illness'] == "1")
    answer_set['number_of_visits'] = params['number_of_visits']
    answer_set['number_of_prescription_drugs'] = params['number_of_prescription_drugs']
    answer_set.save()

    #redirect to "recommendations"
    redirect_to action: 'recommendations', id: id
  end

  def recommendations
    id = params['id']
    @answer_set = AnswerSet.find(id)

    @age = @answer_set['age']
    @age = 30 if @age == nil
    @marital_status = @answer_set['marital_status']
    @preferred_doctor = @answer_set['preferred_doctor']

    @all_health_plans = HealthPlan.all
    first_plan = @all_health_plans[0]

    @premium = first_plan['premium_adult_individual_age_27']
    if (@age > 27)
      @premium = first_plan['premium_adult_individual_age_50']
    end
    if (@marital_status == 'married')
      @premium = first_plan['premium_family_age_30']
    end

    # find the surviving plans
    @health_plans = []
    for health_plan in @all_health_plans do
      plan_type = health_plan['plan_type']

      if @preferred_doctor
        if plan_type == 'HMO'
          @health_plans.append(health_plan)
        end
      else
        @health_plans.append(health_plan)
      end
    end
  end
end