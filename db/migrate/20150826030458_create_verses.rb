class CreateVerses < ActiveRecord::Migration
    def self.up
        create_table :steps do |t|
            t.belongs_to        :parent,:null => false
            t.belongs_to        :child, :null => false
            t.integer           :choice,:null => false, :default => 1
        end

        create_table :verses do |t|
            t.string    :subject
            t.text      :body, :null => false
            t.timestamps
        end
    end

    def self.down
        drop_table :steps
        drop_table :verses
    end
end
