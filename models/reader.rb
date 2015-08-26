class Reader < ActiveRecord::Base
    validates :email, presence: true, length: { minimum: 5 }

    belongs_to :verse

    after_create :send_begin
    after_save :send_verse

    def update_verse(choice)
        self.choice = choice.to_i
        self.save
    end

    def send_begin
        post_mark = Postmark::ApiClient.new(ENV['POSTMARK_API_KEY'])
        post_mark.deliver(
            from:       'murmur@murmur.club',
            to:         self.email,
            subject:    'It began with a murmur',
            text_body:  'And it begins, again, with a murmur....'
        )
    end

    def send_verse
        post_mark = Postmark::ApiClient.new(ENV['POSTMARK_API_KEY'])
        post_mark.deliver(
            from:       'murmur@murmur.club',
            to:         self.email,
            subject:    'The murmurs continued...',
            text_body:  self.verse.body
        )
    end
end
