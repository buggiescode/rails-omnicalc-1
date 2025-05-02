class CalcController < ApplicationController

  def homepage

    render({ :template => "calc_templates/homepage" })

  end

  def square

    @num_to_square = params.fetch("number").to_f
    @num_squared = @num_to_square ** 2

    render({ :template => "calc_templates/square" })

  end

  def square_root_new
    render({ :template => "calc_templates/square_root_new" })
  end

  def square_root_results
    @num_to_square_root = params.fetch("number").to_f
    @num_rooted = @num_to_square_root ** 0.5

    render({ :template => "calc_templates/square_root_results" })
  end

  def payment_new
    render({ :template => "calc_templates/payment_new" })
  end

  def payment_results
    apr = params.fetch("user_apr").to_f
    @apr_formatted = apr.to_fs(:percentage, {:precision => 4})
    prin = params.fetch("user_pv").to_i
    @principal = prin.to_fs(:currency)
    @num_years = params.fetch("user_years").to_i
  
    monthly_interest_rate = apr / 12 / 100
    total_payments = 12 * @num_years
    monthly_payment = prin * monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-total_payments)
    @payment = monthly_payment.to_fs(:currency)

    render({ :template => "calc_templates/payment_results" })
  end

  def random_new
    render({ :template => "calc_templates/random_new" })
  end

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @rand_num = rand(@min..@max)

    render({ :template => "calc_templates/random_results" })
  end

end
