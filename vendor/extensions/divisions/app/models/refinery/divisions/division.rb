module Refinery
  module Divisions
    class Division < Refinery::Core::BaseModel
      self.table_name = 'refinery_divisions'


      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      acts_as_indexed :fields => [:name]

    end
  end
end
