class SwimmersController < ApplicationController
  def show
    @alphabet = ("a".."z").to_a
    @alpha_arr = []
    for i in "a".."z"
      @alpha_arr << Swimmer.find(:all, :conditions => ["last_name LIKE ?", "#{i}%"]) 
    end
  end
end
