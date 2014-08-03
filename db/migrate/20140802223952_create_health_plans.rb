class CreateHealthPlans < ActiveRecord::Migration
  def change
    create_table(:health_plans) do |t|
      t.string :state # Not really used
      t.string :issuer_name # important for display
      t.string :plan_marketing_name # important for display
      t.string :plan_type # HMO or PPO
      t.string :rating_area # not really used

      t.float :premium_adult_individual_age_27
      t.float :premium_adult_individual_age_50
      t.float :premium_family_age_30

      t.float :medical_deductable_individual_in_network
      t.float :drug_deductable_individual_in_network
      t.float :medical_deductable_individual_out_of_network
      t.float :drug_deductable_individual_out_of_network

      t.float :medical_detectable_family_in_network
      t.float :drug_detectable_family_in_network
      t.float :medical_deductable_family_out_of_network
      t.float :drug_deductable_family_out_of_network

      t.float :medical_maximum_out_of_pocket_individual_in_network
      t.float :drug_maximum_out_of_pocket_individual_in_network

      t.float :medical_maximum_out_of_pocket_individual_out_of_network
      t.float :drug_maximum_out_of_pocket_individual_out_of_network

      t.float :medical_maximum_out_of_pocket_family_in_network
      t.float :drug_maximum_out_of_pocket_family_in_network

      t.float :medical_maximum_out_of_pocket_family_out_of_network
      t.float :drug_maximum_out_of_pocket_family_out_of_network

      t.timestamps
    end
  end
end
