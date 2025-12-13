class AccountsController < ApplicationController
  before_action :set_account, only: %i[show]

  def index
    @accounts = Account
      .is_normal
      .is_opened
      .limit(10)
      .includes(:icon)
  end

  def show
    @is_account_owner = @current_account && (@current_account.id == @account.id || admin?)
  end

  private

  def set_account
    return if (@account = Account.is_normal.isnt_closed.find_by(name_id: params[:name_id]))
    return if admin? && (@account = Account.unscoped.find_by(name_id: params[:name_id]))

    render_404
  end
end
