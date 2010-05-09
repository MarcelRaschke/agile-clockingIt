require 'spec_helper'

describe ScmChangesetsController do
  describe "POST create" do
    context "with valid params" do
      before(:each) do
        ScmChangeset.should_receive(:new_from_web_hook).with("scm_changeset"=>{ 'these'=> :params }, "action"=>"create", "controller"=>"scm_changesets").and_return(mock_model(ScmChangeset, :save=>true))
        post :create, :scm_changeset=>{ :these=> :params }
      end
      it "respond with HTTP-STATUS: 201 CREATED" do
        response.status.should =~ /201/
      end
    end
    context "with invalid params" do
      before(:each) do
        ScmChangeset.should_receive(:new_from_web_hook).with("scm_changeset"=>{ 'these'=> :params }, "action"=>"create", "controller"=>"scm_changesets").and_return(mock_model(ScmChangeset, :save=>false))
        post :create, :scm_changeset=>{ :these=> :params }
      end
      it "respond with HTTP-STATUS: 422 Unprocessable Entity" do
        response.status.should =~ /422/
      end
    end
  end
end