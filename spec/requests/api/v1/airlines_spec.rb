require "rails_helper"

RSpec.describe Api::V1::AirlinesController do
  let!(:user) { build(:user) }
  let(:name) { Faker::Company.name + [" Airways", " Airlines"].sample }
  let(:image_url) { Faker::LoremFlickr.image(search_terms: ["airlines", "logo"], match_all: true) }
  let(:params) do
    {
      airline: {
        name: name,
        image_url: image_url
      }
    }
  end

  describe "GET /index" do
    subject { get "/api/v1/airlines" }

    it "returns status code 200" do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    subject { post "/api/v1/airlines", params: params }

    context "with valid parameters" do
      it "returns a created status" do
        subject
        expect(response).to have_http_status(:created)
        expect(response.status).to eq(201)
      end
    end

    context "with invalid parameters" do
      let(:empty_params) do
        {
          airline: {
            name: nil,
            image_url: nil
          }
        }
      end

      subject { post "/api/v1/airlines", params: empty_params }

      it "returns a unprocessable entity status" do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
