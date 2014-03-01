class DocumentsMailer < Mailer

  def document_added(document, notify_info)
    redmine_headers 'Project' => document.project.identifier
    @author = User.current
    @document = document
    @document_url = url_for(:controller => 'documents', :action => 'show', :id => document)
    recipients = document.recipients
    if notify_info
      recipients |= User.where(:id => notify_info[:users]).pluck(:mail)
    end
    mail :to => recipients,
      :subject => "[#{document.project.name}] #{l(:label_document_new)}: #{document.title}" do |format|
      format.html{ render "mailer/document_added" }
    end

  end

  def attachments_added(attachments, notify_info)
    container = attachments.first.container
    added_to = ''
    added_to_url = ''
    @author = attachments.first.author
    case container.class.name
    when 'Project'
      added_to_url = url_for(:controller => 'files', :action => 'index', :project_id => container)
      added_to = "#{l(:label_project)}: #{container}"
      recipients = container.project.notified_users.select {|user| user.allowed_to?(:view_files, container.project)}.collect  {|u| u.mail}
    when 'Version'
      added_to_url = url_for(:controller => 'files', :action => 'index', :project_id => container.project)
      added_to = "#{l(:label_version)}: #{container.name}"
      recipients = container.project.notified_users.select {|user| user.allowed_to?(:view_files, container.project)}.collect  {|u| u.mail}
    when 'Document'
      added_to_url = url_for(:controller => 'documents', :action => 'show', :id => container.id)
      added_to = "#{l(:label_document)}: #{container.title}"
      recipients = container.recipients
      if notify_info
        recipients |= User.where(:id => notify_info[:users]).pluck(:mail)
      end
    end
    redmine_headers 'Project' => container.project.identifier
    @attachments = attachments
    @added_to = added_to
    @added_to_url = added_to_url
    mail :to => recipients,
      :subject => "[#{container.project.name}] #{l(:label_attachment_new)}"
  end
  

end
