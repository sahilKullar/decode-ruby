# frozen_string_literal: true

# PostgreSQL library and tool to generate UUIDs, and Rails allows you to plug UUIDs in as primary keys very quickly.
class EnableExtensionForUuid < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  end
end
