class Reader < ActiveRecord::Base
    validates :email, presence: true, length: { minimum: 5 }

    def send_begin(email)
        post_mark = Postmark::ApiClient.new(ENV['POSTMARK_API_KEY'])
        post_mark.deliver(
            from:   'murmur@murmur.club',
            to:     self.email,
            subject: 'It began with a murmur',
            text_body: 'It began with a murmur....'
        )
    end
end
