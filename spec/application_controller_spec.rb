require 'spec_helper'

describe 'ApplicationController' do
  describe 'Index page /' do

    it 'responds with a 200 status code' do
      expect(page.status_code).to eq(200)
    end

  end

end