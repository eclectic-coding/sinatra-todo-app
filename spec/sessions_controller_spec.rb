require_relative 'spec_helper'

def app
  SessionsController
end

describe SessionsController do
  it 'responds with a welcome message' do
    get '/login'
    expect(last_response.status).to eq(200)
    #expect(last_response.body).to include('Are you Busy?')
  end
end
