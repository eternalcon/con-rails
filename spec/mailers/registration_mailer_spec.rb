require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do
  describe "Registration" do
    let(:mail) { RegistrationMailer.Registration }

    it "renders the headers" do
      expect(mail.subject).to eq("Registration")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "Registration_Team" do
    let(:mail) { RegistrationMailer.Registration_Team }

    it "renders the headers" do
      expect(mail.subject).to eq("Registration team")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
