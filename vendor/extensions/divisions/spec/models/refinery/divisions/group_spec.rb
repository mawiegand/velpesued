require 'spec_helper'

module Refinery
  module Divisions
    describe Group do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:group,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
