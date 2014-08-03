class CreateAnswerSets < ActiveRecord::Migration
  def change
    create_table(:answer_sets) do |t|
      t.integer :age
      t.string :scope
      t.boolean :smoker
      t.references :user
      t.float :risk_tolerance

      t.timestamps
    end
    add_index :answer_sets, :user_id
  end
end
