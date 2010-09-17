class IndexController < ApplicationController
  # Okreslamy jakie filtry mają być pominiete w tym kontrolerze
  skip_before_filter :check_authorization
  
  def index
    
  end
end
