class CreateReviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewers do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
