module Refinery
  module Divisions
    class Group < Refinery::Core::BaseModel


      validates :name, :presence => true

      belongs_to :photo, :class_name => '::Refinery::Image'
      belongs_to :division

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      acts_as_indexed :fields => [:name]

    end
  end
end
