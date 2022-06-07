require "rails_helper"

RSpec.describe Api::V1::AirlinesController do
  let!(:user) { FactoryBot.create(:user) }
  let(:params) do
    {
      airline: {
        name: my_airline.name,
        image_url: Faker::LoremFlickr.image(
          search_terms: ["airlines", "logo"],
          match_all: true
        )
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
    context "with valid parameters" do
      let!(:my_airline) { FactoryBot.create(:airline) }

      subject { post "/api/v1/airlines", params: params }

      it "returns the name" do
        subject
        expect(json["name"]).to eq(my_airline.name)
      end

      it "returns the slug" do
        subject
        expect(json["slug"]).to eq(my_airline.slug)
      end

      it "returns a created status" do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      before do
        post "/api/v1/airlines",
          params: {
            airline: {
              name: ""
            }
          }
      end

      it "returns a unprocessable entity status" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
