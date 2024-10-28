class ZebraController < ApplicationController
  def home
    render({ :template => "game_templates/new_square_calc" })
  end

  def square_new
    render({ :template => "game_templates/new_square_calc" })
  end

  def square_results
    @the_num = params.fetch("users_number").to_f

    @the_result = @the_num ** 2
    render({ :template => "game_templates/square_results" })
  end

  def square_root_new
    render({ :template => "game_templates/new_square_root_calc" })
  end

  def square_root_results
    @the_num = params.fetch("users_number").to_f

    @the_result = @the_num ** 0.5
    render({ :template => "game_templates/square_root_results" })
  end
  
  def random_new
    render({ :template => "game_templates/new_random_calc" })
  end

  def random_results
    @the_min = params.fetch("users_min").to_f
    @the_max = params.fetch("users_max").to_f

    @the_result = rand(@the_min..@the_max)
    render({ :template => "game_templates/random_results" })
  end

  def payment_new
    render({ :template => "game_templates/new_payment_calc" })
  end

  def payment_results
    @the_apr = params.fetch("users_apr").to_f
    @the_years = params.fetch("users_years").to_i
    @the_principal = params.fetch("users_principal").to_f

    @rate = @the_apr / 1200
    @final_apr = @the_apr.to_fs(:percentage, { :precision => 4 } )
    @n = @the_years * 12

    @numerator = @rate * @the_principal
    @final_principal = @the_principal.to_fs(:currency)

    @sub_denominator = 1 + @rate
    @next_sub_denominator = @sub_denominator ** -@n
    @denominator = 1 - @next_sub_denominator



    @almost = @numerator / @denominator
    @the_result = @almost.to_fs(:currency)
    render({ :template => "game_templates/payment_results" })
  end

end
