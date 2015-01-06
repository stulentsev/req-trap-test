class TrappedRequestsController < ApplicationController
  before_action :set_trap_id
  skip_before_filter :verify_authenticity_token

  def index
    @trapped_requests = TrappedRequest.for_trap(@trap_id)
  end

  def create
    TrappedRequest.create!(
      trap_id: @trap_id,
      params: serialize(simple_values(params)),
      referrer: request.referer,
      http_method: request.method,
      remote_ip: request.remote_ip,
      scheme: request.scheme,
      headers: serialize(simple_values(request.headers)),
    )

    head :ok
  rescue
    head :internal_server_error
  end

  def show
    @trapped_request = TrappedRequest.for_trap(@trap_id).with_id(params[:id]).first

    unless @trapped_request
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end

  private
  def set_trap_id
    @trap_id = params.fetch(:trap_id)
  end

  def serialize(hash)
    JSON.generate(hash)
  end

  def simple_values(key_value_list)
    key_value_list.each_with_object({}) do |(k, v), memo|
      memo[k] = v if simple_value?(v)
    end
  end

  def simple_value?(v)
    case v
    when String, Fixnum, Hash, Array, TrueClass, FalseClass, NilClass
      true
    else
      false
    end
  end
end
