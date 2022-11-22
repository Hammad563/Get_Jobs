require 'rails_helper'

RSpec.describe "Api::V1::Auths", type: :request do
    let(:user1) {create(:user)}


    def get_tokens(user)
        Doorkeeper::AccessToken.create!(resource_owner_id: user.id, scopes: "public manage")
        token = Doorkeeper::AccessToken.create!(resource_owner_id: user.id, use_refresh_token: true, expires_in: Doorkeeper.configuration.access_token_expires_in)
    
        [token.token, token.refresh_token]
    end

    before :each do
        @access_token, @refresh_token = get_tokens(user1)
    end


    describe "login" do
        it "logs in user and gives a response" do
            post_params  = {
                email: "testuser@gmail.com",
                password: "password"
            }
            post "/api/v1/login", params: post_params.to_json
            expect(response.status).to eq 200
            puts response.body
        end  
    end


end
