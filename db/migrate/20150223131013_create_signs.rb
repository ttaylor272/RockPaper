class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|

      t.timestamps
    end
  end
end
