require "rails_helper"

RSpec.describe FfRegistrationMailer, type: :mailer do
  describe "registration" do
    let(:mail) { FfRegistrationMailer.registration }

    it "renders the headers" do
      expect(mail.subject).to eq("Registration")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "registration_confirm" do
    let(:mail) { FfRegistrationMailer.registration_confirm }

    it "renders the headers" do
      expect(mail.subject).to eq("Registration confirm")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
