class Person
  class BaseController < ApplicationController
    before_action :authenticate_person!
    before_action :set_current_person

    private

    def set_current_person
      @person ||= current_person
    end
  end
end
