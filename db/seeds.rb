# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

HealthPlan.create(
    state: "4",
    issuer_name: "Cigna Health & Life",
    plan_marketing_name: "My Cigna Health Savings 3400",
    plan_type: "PPO",
    rating_area: "48",

    premium_adult_individual_age_27: 246.7,
    premium_adult_individual_age_50: 420.42,
    premium_family_age_30: 833.31,

    medical_deductable_individual_in_network: 3400.0,
    drug_deductable_individual_in_network: 0.0,
    medical_deductable_individual_out_of_network: 12500.0,
    drug_deductable_individual_out_of_network: 0.0,
    medical_deductable_family_in_network: 6800.0,
    drug_deductable_family_in_network: 0.0,
    medical_deductable_family_out_of_network: 25000.0,
    drug_deductable_family_out_of_network: 0.0,
    medical_maximum_out_of_pocket_individual_in_network: 6350.0,
    drug_maximum_out_of_pocket_individual_in_network: 0.0,
    medical_maximum_out_of_pocket_individual_out_of_network: 25000.0,
    drug_maximum_out_of_pocket_individual_out_of_network: 0.0,
    medical_maximum_out_of_pocket_family_in_network: 12700.0,
    drug_maximum_out_of_pocket_family_in_network: 0.0,
    medical_maximum_out_of_pocket_family_out_of_network: 50000.0,
    drug_maximum_out_of_pocket_family_out_of_network: 0.0)

