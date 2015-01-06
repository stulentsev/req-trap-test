class TrappedRequestsController < ApplicationController
  before_action :set_trap_id

  def index
    @trapped_requests = TrappedRequest.for_trap(@trap_id)
  end

  def create
    TrappedRequest.create!(
      trap_id: @trap_id,
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

  private
  def set_trap_id
    @trap_id = params.fetch(:trap_id)
  end
end
