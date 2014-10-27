class HomeController < ApplicationController
  def index
    @surveys = Survey.order('created_at DESC')
  end

  def error_404
    render_404
  end
end
