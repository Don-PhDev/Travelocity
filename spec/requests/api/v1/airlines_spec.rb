require "rails_helper"

RSpec.describe Api::V1::AirlinesController do
  describe "GET /index" do
    subject { get "/api/v1/posts" }

    it "returns status code 200" do
      subject
      expect(response).to have_http_status(:success)
    end
  end
end
