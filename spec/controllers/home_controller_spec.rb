require 'spec_helper'

describe HomeController do

  describe "GET 'developer'" do
    it "returns http success" do
      get 'developer'
      response.should be_success
    end
  end

  describe "GET 'admin'" do
    it "returns http success" do
      get 'admin'
      response.should be_success
    end
  end

end
