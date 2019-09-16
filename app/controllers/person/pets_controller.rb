class Person
  class PetsController < Person::BaseController
    def index
      pets = @person.pets.active
      @index_presenter = Pets::IndexPresenter.new(pets).call
    end

    def new
      @pet = @person.pets.new
      @new_presenter = Pets::NewPresenter.new(@pet).call
    end

    def create
      response = Pets::CreateService.new(@person, pet_params).call

      if response.success?
        redirect_to person_pets_path, success: response.message
      else
        @pet = response.pet
        @new_presenter = Pets::NewPresenter.new(@pet).call
        flash[:error] = response.message
        render :new
      end
    end

    def edit
      @pet = @person.pets.active.find(params[:id])
      @edit_presenter = Pets::EditPresenter.new(@pet).call
    end

    def update
      @pet = @person.pets.active.find(params[:id])
      response = Pets::UpdateService.new(@pet, pet_params).call

      if response.success?
        redirect_to person_pets_path, success: response.message
      else
        @edit_presenter = Pets::EditPresenter.new(@pet).call
        flash[:error] = response.message
        render :edit
      end
    end

    def destroy
      @pet = @person.pets.active.find(params[:id])
      @pet.update!(deleted_at: Time.zone.now)

      redirect_to person_pets_path, success: "Pet #{@pet.name} foi removido da sua lista."
    end

    private

    def pet_params
      params.require(:pet).permit(:name, :kind, :monthly_cost)
    end
  end
end
