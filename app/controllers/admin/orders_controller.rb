class Admin::OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?
    layout "applicationadmin"
end
