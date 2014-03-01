require_dependency 'documents_controller'

class DocumentsController < ApplicationController
  def create_with_changes
    @document = @project.documents.build
    @document.safe_attributes = params[:document]
    @document.save_attachments(params[:attachments])
    if @document.save
      @document.send_notification_to_users(params['documents_notifier'])
      render_attachment_warning_if_needed(@document)
      flash[:notice] = l(:notice_successful_create)
      redirect_to project_documents_path(@project)
    else
      render :action => 'new'
    end
  end

  def add_attachment_with_changes
    attachments = Attachment.attach_files(@document, params[:attachments])
    render_attachment_warning_if_needed(@document)

    if attachments.present? && attachments[:files].present? && Setting.notified_events.include?('document_added')
      DocumentsMailer.attachments_added(attachments[:files], params["documents_notifier"]).deliver
    end
    redirect_to document_path(@document)
  end

  alias_method_chain :create, :changes

  alias_method_chain :add_attachment, :changes
  
end

