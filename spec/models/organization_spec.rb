require 'rails_helper'

RSpec.describe Organization, type: :model do
    let(:organization) {Organization.new(email: "test@test.com", name: "FakeOrganization", phone: "0000000000", status: "submitted", transportation: "yes", primary_name: "PrimaryFakeName", secondary_name: "SecondFakeOrganisation", secondary_phone: "1111111111")}

    describe "attributes" do
        it "has the name" do
            expect(organization).to respond_to(:name)
        end

        it "has the email" do
            expect(organization).to to_respond(:email)
        end

        it "has the phone" do
            expect(organization).to to_respond(:phone)
        end

        it "has the status" do
            expect(organization).to to_respond(:status)
        end

        it "has the transportation" do
            expect(organization).to to_respond(:transporation)
        end

        it "has the primary name" do
            expect(organization).to to_respond(:primary_name)
        end

        it "has the secondary name" do
            expect(organization).to to_respond(:secondary_name)
        end

        it "has the secondary phone" do
            expect(organization).to to_respond(:secondary_phone)
        end
    end

    

end
