require_dependency 'document'
class Document < ActiveRecord::Base

  def send_notification_to_users(attributes)
    if Setting.notified_events.include?('document_added')
      DocumentsMailer.document_added(self, attributes).deliver
    end
  end

  def send_notification_with_changes
    false
  end
  
  alias_method_chain :send_notification, :changes
end

