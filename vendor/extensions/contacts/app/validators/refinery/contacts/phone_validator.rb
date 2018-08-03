module Refinery
  module Contacts
    class PhoneValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        unless value =~ /^$|(\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z)/i
          record.errors[attribute] << (options[:message] || ::I18n.t('refinery.contacts.admin.contacts.records.no_valid_phone'))
        end
      end
    end
  end
end
