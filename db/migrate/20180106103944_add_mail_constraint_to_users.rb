class AddMailConstraintToUsers < ActiveRecord::Migration[5.1]
  def up
    execute %{
      ALTER TABLE
        users
      ADD CONSTRAINT
        email_must_be_company_email
      CHECK ( email ~* '^[^@]+@jwkyle\\.com$' )
    }
  end

  def down
    execute %{
      ALTER TABLE
        users
      ADD CONSTRAINT
        email_must_be_company_email
    }
  end
end
