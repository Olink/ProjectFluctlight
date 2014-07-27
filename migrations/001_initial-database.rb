# Hey there, this runs a database migration.
# From a command line, execute:
# > sequel -m . -M 1 mysql://user:pass@host/database_name
#
# Example:
# > sequel -m . -M 1 mysql://root@localhost/white_lotus

Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :username
      String :password
      Time :created
    end
  end

  down do
    drop_table(:users)
  end
end