module ActionView
  module Helpers
    module FormTagHelper
	  def button(value = "Save changes", options = {})
        options = options.stringify_keys

        if disable_with = options.delete("disable_with")
          options["data-disable-with"] = disable_with
        end

        tag :button, { "type" => "submit", "name" => "commit", "value" => value }.update(options)
      end
    end
  end
end