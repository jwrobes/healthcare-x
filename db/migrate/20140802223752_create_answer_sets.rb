class CreateAnswerSets < ActiveRecord::Migration
  def change
    create_table(:answer_sets) do |t|
      t.references :user

      t.string :gender
      t.integer :age
      t.string :zip_code
      t.string :marital_status
      t.string :scope
      t.boolean :smoker
      t.integer :number_of_children
      t.float :household_income
      t.boolean :preferred_doctor
      t.integer :number_of_prescription_drugs
      t.boolean :illness
      t.integer :number_of_visits
      t.boolean :procedure_planned

      t.timestamps
    end
    add_index :answer_sets, :user_id
  end
end
