require 'documents_notifier_listener_hook'
require 'documents_controller'
require 'documents_mailer'
require 'document'

Redmine::Plugin.register :documents_notifier do
  name 'Documents Notifier plugin'
  author 'Mikhail'
  description 'Sending documents notification'
  version '0.1.0'
end
