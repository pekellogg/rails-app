class License < ApplicationRecord
    belongs_to(:contractor)
    belongs_to(:state)
    # table headers constants
    COLUMNS = ["number".to_sym, "type_code".to_sym, "code_desc".to_sym, "specialty_code".to_sym, "specialty_code_desc".to_sym, "status_code".to_sym, "ubi".to_sym, "effective".to_sym, "expires".to_sym, "status_desc".to_sym, "status".to_sym, "contractor_id".to_sym, "state_id".to_sym]
end
