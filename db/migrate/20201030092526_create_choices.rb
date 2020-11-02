class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :choice, null: false
      t.boolean :answer_is, null: false
      t.references :quiz, null: false, foreign_key: true
      t.timestamps
    end
  end
end
