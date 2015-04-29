require 'spec_helper'

describe 'IndexControllerSpec' do
  describe "GET '/' route" do
    context "Shows a list of all the URLs in the database." do
      it 'should list all urls in the database' do
        get '/'
        expect(last_response.status).to be 200
        expect(last_response.body).to include '<p>http://'
      end
    end
  end
  describe "POST '/urls' route" do
    context "Creates a new Url, checks if valid? and saves to database" do
      it 'should save a valid Url' do
        post '/urls'
        expect(last_response.status).to be 200
        expect{Url.count}.to change{Url.count}.by(1)
      end
    end
    context "Creates a new Url, checks if valid? and saves to database" do
      it 'should save a valid Url' do
        expect
      end
    end
  end
end
