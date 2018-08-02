require 'spec_helper'

module Refinery
  module Contacts
    describe Contact do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:contact,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
