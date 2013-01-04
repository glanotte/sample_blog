require 'spec_helper'

describe PostsController do
  describe "POST to create with HTML" do
    before do
      post :create, post: {title: "post title", body: "post body"}
    end

    it "saves the record to the database" do
      Post.last.title.should eq("post title")
    end
  end

  describe "POST to create with JSON as text" do
    before do
      post :create, post: {title: "post title", body: "post body"}.to_json, format: :json
    end

    it "saves the record to the database" do
      Post.last.title.should eq("post title")
    end

    it "returns json" do
      JSON.parse(response.body)['title'].should eq('post title')
    end
  end
end
