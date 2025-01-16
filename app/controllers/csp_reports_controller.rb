class CspReportsController < ApplicationController
  skip_before_action :verify_authenticity_token # レポート送信にはCSRFトークンは不要

  def create
    # レポート内容をログに出力
    Rails.logger.info "CSP Violation Report: #{request.body.read}"
    head :no_content
  end
end
