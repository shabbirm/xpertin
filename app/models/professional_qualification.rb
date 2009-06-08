class ProfessionalQualification < ActiveRecord::Base
   validates_presence_of :name, :sequence
end
