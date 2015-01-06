require 'test_helper'

class TrappingRequestsTest < ActionDispatch::IntegrationTest
  def random_trap_url
    @trap_url ||= begin
      trap_id = SecureRandom.hex(10)
      "/#{trap_id}"
    end
  end

  test 'create with GET' do
    get random_trap_url
    assert_response :success
  end

  test 'create with POST' do
    post random_trap_url
    assert_response :success
  end

  test 'create with PATCH' do
    patch random_trap_url
    assert_response :success
  end

  test 'create with PUT' do
    put random_trap_url
    assert_response :success
  end

  test 'create with DELETE' do
    delete random_trap_url
    assert_response :success
  end

end
