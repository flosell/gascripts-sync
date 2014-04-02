# require "ScriptProject"
require 'spec_helper'

describe "ScriptProject" do 
  before(:each) do 
    @hash={
    "files" => [{
      "id"=> "efe59460-dc6c-4d85-8b49-561374a48ad9",
       "name"=> "Code",
       "type"=> "server_js",
       "source"=> "this is test"
    }]}

    @sp = ScriptProject.from_hash(@hash)
  end

  it "should find id for file" do 
    @sp.id_from_name("Code.server_js").should eq "efe59460-dc6c-4d85-8b49-561374a48ad9"
  end

  it "should return nil if nothing was found" do 
    @sp.id_from_name("something").should eq  nil
  end

  it "should convert to hash" do 
    @sp.to_hash.should eq @hash
  end
end
