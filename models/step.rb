# == Schema Information
#
# Table name: steps
#
#  id        :integer          not null, primary key
#  parent_id :integer          not null
#  child_id  :integer          not null
#  choice    :integer          default(1), not null
#

class Step < ActiveRecord::Base
    
    belongs_to :child, class_name: "Verse"
    belongs_to :parent, class_name: "Verse"

end
