module Refinery
  module Divisions
    class Position < Refinery::Core::BaseModel


      validates :title, :presence => true, :uniqueness => true

      belongs_to :contact, :class_name => '::Refinery::Contacts::Contact'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
