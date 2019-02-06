# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Facilities" do
    describe "Admin" do
      describe "facilities", type: :feature do
        refinery_login

        describe "facilities list" do
          before do
            FactoryBot.create(:facility, :name => "UniqueTitleOne")
            FactoryBot.create(:facility, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.facilities_admin_facilities_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.facilities_admin_facilities_path

            click_link "Add New Facility"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Facilities::Facility, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Facilities::Facility, :count)

              expect(page).to have_content("Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryBot.create(:facility, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.facilities_admin_facilities_path

              click_link "Add New Facility"

              fill_in "Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Facilities::Facility, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryBot.create(:facility, :name => "A name") }

          it "should succeed" do
            visit refinery.facilities_admin_facilities_path

            within ".actions" do
              click_link "Edit this facility"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            expect(page).to have_content("'A different name' was successfully updated.")
            expect(page).not_to have_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryBot.create(:facility, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.facilities_admin_facilities_path

            click_link "Remove this facility forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Facilities::Facility.count).to eq(0)
          end
        end

      end
    end
  end
end
