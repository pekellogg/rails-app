# note --> uncomment out code to install in Gemfile, too
# note --> require "activerecord-import"

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # note --> uncomment out code to install once data formatted within app/helpers -> jobs/data_job
  # def self.ar_import_companies(columns, collection)
  #   self.import(columns, collection)
  # end
end