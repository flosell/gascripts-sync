require 'spec_helper'

describe "ProjectFile" do 
  before(:each) do 
    hash={
      "id" => "efe59460-dc6c-4d85-8b49-561374a48ad9",
       "name" => "Code",
       "type" => "server_js",
       "source" => "this is test"
    }

    @file = ProjectFile.new(hash)
  end

  it "should have type" do 
    @file.type.should eq "server_js"
  end

  it "should have a name" do 
    @file.name.should eq "Code"
  end

  it "should have an id" do
    @file.id.should eq  "efe59460-dc6c-4d85-8b49-561374a48ad9"
  end

  it "should have a source" do 
    @file.source.should eq "this is test" 
  end

  it "should have a complete filename" do
    @file.filename.should eq "Code.server_js"
  end
end
