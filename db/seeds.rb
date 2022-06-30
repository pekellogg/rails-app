require_relative "../app/jobs/data_job"
require_relative "../app/jobs/application_job"
require_relative "../app/helpers/application_data"
require_relative "../app/helpers/contractors_helper"
require_relative "../app/models/contractor"
require_relative "../app/helpers/licenses_helper"
require_relative "../app/models/license"
require_relative "../app/helpers/businesses_helper"
require_relative "../app/models/business"

wa = State.create(name: "Washington", name_abbrev: "WA") if State.all.count == 0
DataJob::call_and_create