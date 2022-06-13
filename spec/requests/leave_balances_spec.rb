require 'rails_helper'

RSpec.describe "LeaveBalances", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/leave_balances/index"
      expect(response).to have_http_status(:success)
    end
  end

end
