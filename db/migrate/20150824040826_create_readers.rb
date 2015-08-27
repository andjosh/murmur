class CreateReaders < ActiveRecord::Migration
    def self.up
       create_table :readers do |t|
            t.string    :email, :null => false
            t.string    :status,:default => "closed"
            t.integer   :choice,:default => 1
            t.belongs_to        :verse
            t.timestamps
        end 

        add_index :readers, :email, :unique => true
    end 

    def self.down
        drop_table :readers
    end 
end
