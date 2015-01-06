class TrappedRequestsController < ApplicationController
  def index
  end

  def create
    TrappedRequest.create!(
      trap_id: params[:trap_id],
      params: params.to_json,
      referrer: request.referer,
      http_method: request.method,
      remote_ip: request.remote_ip,
      scheme: request.scheme,
      headers: Hash[request.headers.to_a],
    )

    head :ok
  rescue
    head :internal_server_error
  end

  def show
  end
end
