require "spec_helper"

describe ProcessedDataController do
  describe "routing" do

    it "routes to #index" do
      get("/processed_data").should route_to("processed_data#index")
    end

    it "routes to #new" do
      get("/processed_data/new").should route_to("processed_data#new")
    end

    it "routes to #show" do
      get("/processed_data/1").should route_to("processed_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/processed_data/1/edit").should route_to("processed_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/processed_data").should route_to("processed_data#create")
    end

    it "routes to #update" do
      put("/processed_data/1").should route_to("processed_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/processed_data/1").should route_to("processed_data#destroy", :id => "1")
    end

  end
end
