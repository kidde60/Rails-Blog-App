class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :Text

      t.timestamps
    end
  end
end

Site:boards.greenhouse.io front end developer remote
