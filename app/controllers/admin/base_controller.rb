# frozen_string_literal: true

class Admin::BaseController < ActionController::Base
  before_action :authenticate_user!
  layout 'admin/layouts/application'
end
