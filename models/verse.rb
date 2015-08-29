# == Schema Information
#
# Table name: verses
#
#  id         :integer          not null, primary key
#  subject    :string
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Verse < ActiveRecord::Base
    validates :subject, presence: true
    validates :body, presence: true

    has_many :steps, foreign_key: "parent_id"
    has_many :children, -> { order "choice" }, through: :steps
    has_one :step_parent, class_name: "Step", foreign_key: "child_id"
    has_one :parent, through: :step_parent

    def composed
        text = self.body
        text += "\n\n---\n\n"
        for c in self.children
            text += c.step_parent.choice.to_s + ": " + c.subject + "\n"
        end
        text
    end

end
