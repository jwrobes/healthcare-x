class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :age
      t.string :scope
      t.boolean :smoker
      t.references :user

      t.timestamps
    end
    add_index :answers, :user_id
  end
end
