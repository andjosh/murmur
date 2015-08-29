# == Schema Information
#
# Table name: readers
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  status     :string           default("closed")
#  choice     :integer          default(1)
#  verse_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Reader < ActiveRecord::Base
    validates :email, presence: true, length: { minimum: 5 }

    belongs_to :verse

    after_create :send_verse
    after_save :send_verse, if: :verse_id_changed?

    def update_verse(choice)
        step = self.verse.steps.find_by_choice(choice)
        if step
            self.verse = step.child
        else
            self.verse = Verse.first
        end
        self.choice = choice.to_i
        self.save
    end

    def send_verse
        post_mark = Postmark::ApiClient.new(ENV['POSTMARK_API_KEY'])
        composed = self.verse.composed
        subject = self.verse.subject + '...murmurs'
        post_mark.deliver(
            from:       'murmurs@andjosh.com',
            to:         self.email,
            subject:    subject,
            html_body:  composed,
            text_body:  composed
        )
    end
end
