require 'rails_helper'

RSpec.describe Organization, type: :model do
    let(:organization) {Organization.new(email: "test@test.com", name: "FakeOrganization", phone: "0000000000", status: "submitted", transportation: "yes", primary_name: "PrimaryFakeName", secondary_name: "SecondFakeOrganiz}ation", secondary_phone: "1111111111", description: "Fake description here")}

    describe "attributes" do
        it "has the name" do
            expect(organization).to respond_to(:name)
        end

        it "has the email" do
            expect(organization).to respond_to(:email)
        end

        it "has the phone" do
            expect(organization).to respond_to(:phone)
        end

        it "has the status" do
            expect(organization).to respond_to(:status)
        end

        it "has the transportation" do
            expect(organization).to respond_to(:transportation)
        end

        it "has the primary name" do
            expect(organization).to respond_to(:primary_name)
        end

        it "has the secondary name" do
            expect(organization).to respond_to(:secondary_name)
        end

        it "has the secondary phone" do
            expect(organization).to respond_to(:secondary_phone)
        end

        it "has the description" do
            expect(organization).to respond_to(:description)
        end
    end
    
    describe "validations" do
        it { organization.should validate_presence_of(:name) }
        it { organization.should validate_presence_of(:email) }
        it { organization.should validate_presence_of(:phone) }
        it { organization.should validate_presence_of(:status) }
        it { organization.should validate_presence_of(:primary_name) }
        it { organization.should validate_presence_of(:secondary_name) }
        it { organization.should validate_presence_of(:secondary_phone) }
        it { organization.should validate_length_of(:email).is_at_least(1).is_at_most(255) }
        it { organization.should validate_length_of(:name).is_at_least(1).is_at_most(255) }
        it { organization.should allow_value(organization.email).for(:email) }
        it { organization.should validate_uniqueness_of(:email).case_insensitive }
        it { organization.should validate_uniqueness_of(:name).case_insensitive }
        it { organization.should validate_length_of(:description).is_at_most(1020) }
    end

    describe "methods" do
        it "approve the status" do
            organization.approve
            expect(organization.status).to eq('approved')
        end

        it "reject the status" do
            organization.reject
            expect(organization.status).to eq('rejected')
        end

        it "set default status" do
            organization.set_default_status
            expect(organization.status).to eq('submitted')
        end

        it 'returns the name' do
            name = organization.name
            expect(organization.to_s).to eq(name)
        end
    end
end
