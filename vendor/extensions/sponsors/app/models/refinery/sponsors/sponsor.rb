module Refinery
  module Sponsors
    class Sponsor < Refinery::Core::BaseModel
      self.table_name = 'refinery_sponsors'


      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      acts_as_indexed :fields => [:name]

      scope :published, -> { where(published: true) }

    end
  end
end
