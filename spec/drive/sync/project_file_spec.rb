require 'spec_helper'

describe "ProjectFile" do 
  before(:each) do 
    hash={
      "id" => "efe59460-dc6c-4d85-8b49-561374a48ad9",
       "name" => "Code",
       "type" => "server_js",
       "source" => "this is test"
    }

    @file_from_hash = ProjectFile.from_hash(hash)
    @file_from_constructor = ProjectFile.new("efe59460-dc6c-4d85-8b49-561374a48ad9","Code","server_js","this is test")
  end

  it "should have type" do 
    @file_from_hash.type.should eq "server_js"
    @file_from_constructor.type.should eq "server_js"
  end

  it "should have a name" do 
    @file_from_hash.name.should eq "Code"
    @file_from_constructor.type.should eq "server_js"
  end

  it "should have an id" do
    @file_from_hash.id.should eq  "efe59460-dc6c-4d85-8b49-561374a48ad9"
    @file_from_constructor.id.should eq  "efe59460-dc6c-4d85-8b49-561374a48ad9"
  end

  it "should have a source" do 
    @file_from_hash.source.should eq "this is test" 
    @file_from_constructor.id.should eq  "efe59460-dc6c-4d85-8b49-561374a48ad9"
  end

  it "should have a complete filename" do
    @file_from_hash.filename.should eq "Code.server_js"
    @file_from_constructor.filename.should eq "Code.server_js"
  end
end
