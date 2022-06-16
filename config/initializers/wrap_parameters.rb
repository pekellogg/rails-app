# Be sure to restart your server when you modify this file.

# configs for ActionController::ParamsWrapper (enabled by default) are set here

# Enable parameter wrapping for JSON. 
# disable by setting :format to empty array.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#   self.include_root_in_json = true
# end