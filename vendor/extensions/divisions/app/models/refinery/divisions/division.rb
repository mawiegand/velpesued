module Refinery
  module Divisions
    class Division < Refinery::Core::BaseModel
      extend FriendlyId
      friendly_id :name, :use => :slugged

      self.table_name = 'refinery_divisions'


      validates :name, :presence => true, :uniqueness => true

      has_many :groups, :dependent => :destroy

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      acts_as_indexed :fields => [:name]

      def should_generate_new_friendly_id?
        name_changed? || super
      end
    end
  end
end
