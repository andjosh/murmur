require './app'

RSpec.describe Verse do
    context "with no children" do
        it "composes itself as a text message" do
            verse = Verse.new(subject: "subject", body: "body")
            expect(verse.composed_text).to eq "body\n\n---\n\n"
        end
        it "composes itself as an html message" do
            verse = Verse.new(subject: "subject", body: "body")
            expect(verse.composed_html).to eq "body<br><br>---<br><br>"
        end
    end
end
