class ApplicationController < ActionController::Base
  layout("wrapper.html.erb")

 # def home
  # render ({:template => "templates/application.html.erb"}) 
 # end

  def blank_square_form
    render ({:template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num**2
    render ({:template => "calculation_templates/square_results.html.erb"})
  end

  def blank_root_form
    render ({:template => "calculation_templates/square_root_form.html.erb"})
  end 

  def calculate_square_root
    @num = params.fetch("number").to_f
    @square_root_of_num = @num**0.5
    render ({:template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render ({:template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = (params.fetch("user_apr").to_f)
    month_i = @apr/100
    @num_of_years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f
    @numerator = (month_i/12)*@principal
    @denominator = 1-(1+(month_i/12))**(-1*(@num_of_years*12))
    @payment = @numerator/@denominator
    render ({:template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render ({:template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @max = params.fetch("user_max").to_f
    @min = params.fetch("user_min").to_f
    @rand_num = rand(@min..@max).round(12)
    render ({:template => "calculation_templates/random_results.html.erb"})
  end
end