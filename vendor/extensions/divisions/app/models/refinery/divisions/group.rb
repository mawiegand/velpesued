module Refinery
  module Divisions
    class Group < Refinery::Core::BaseModel
      extend FriendlyId
      friendly_id :name, use: [:slugged, :finders, :scoped], scope: :division, routes: :default

      validates :name, :presence => true

      belongs_to :photo, :class_name => '::Refinery::Image', :optional => true
      belongs_to :division
      has_many :positions, :as => :manageable, :dependent => :destroy

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      acts_as_indexed :fields => [:name]

      def full_name
        [name, division&.name].join(' ')
      end

      def should_generate_new_friendly_id?
        name_changed? || super
      end
    end
  end
end
