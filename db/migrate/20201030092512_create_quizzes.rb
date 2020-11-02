class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text :quiz,  null: false
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
