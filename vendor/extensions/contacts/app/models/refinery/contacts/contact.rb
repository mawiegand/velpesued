module Refinery
  module Contacts
    class Contact < Refinery::Core::BaseModel
      self.table_name = 'refinery_contacts'


      validates :name, :presence => true, :uniqueness => true
      validates :mail, :email => true, :uniqueness => true
      validates :phone, :mobile, :phone => true

      belongs_to :photo, :class_name => '::Refinery::Image', :optional => true

      has_many :positions, :class_name => '::Refinery::Divisions::Position', :dependent => :destroy

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      acts_as_indexed :fields => [:name]

    end
  end
end
