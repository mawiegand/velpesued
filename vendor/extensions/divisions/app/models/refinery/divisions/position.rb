module Refinery
  module Divisions
    class Position < Refinery::Core::BaseModel


      validates :title, :presence => true, :uniqueness => {:scope => [:manageable_type, :manageable_id]}

      belongs_to :contact, :class_name => '::Refinery::Contacts::Contact'
      belongs_to :manageable, :polymorphic => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      acts_as_indexed :fields => [:title]

      def manageable_global_id
        manageable&.to_global_id
      end

      def manageable_global_id=(global_id)
        self.manageable = GlobalID::Locator.locate global_id
      end

      def manageable_title
        [title, manageable.name].join(' ')
      end

      def full_title
         [manageable_title, manageable&.try(:division)&.name].join(' ')
      end

      def division_name
        manageable&.try(:division)&.name || manageable.name
      end

    end
  end
end
