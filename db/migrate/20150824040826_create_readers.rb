class CreateReaders < ActiveRecord::Migration
    def self.up
       create_table :readers do |t|
            t.string :email, :null => false
            t.string :status, :default => "closed"
            t.integer :step, :default => 0
            t.integer :choice, :default => 1
            t.timestamps
        end 
    end 

    def self.down
        drop_table :readers
    end 
end
