require 'spec_helper'

describe "Belief pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "belief creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a belief" do
        expect { click_button "Post" }.not_to change(Belief, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'belief_content', with: "Lorem ipsum" }
      it "should create a belief" do
        expect { click_button "Post" }.to change(Belief, :count).by(1)
      end
    end
  end
end