require 'sqlite3'
if File.exists?("maindata.db")
  File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")
db.execute <<-SQL
    CREATE TABLE users(
      id INTEGER PRIMARY KEY,
      email VARCHAR,
      password VARCHAR);
    INSERT INTO users(email, password)
    VALUES(bob@dylan.com, dylan123);
    INSERT INTO users(email, password)
    VALUES(abe@whatever.com, abe123);
    INSERT INTO users(email, password)
    VALUES(jon@lalaland.com, lala123);
    
  SQL
rows = db.execute("SELECT * FROM users")
puts (rows)
#or
db.execute <<-SQL
	DECLARE @users nvarchar(128);
	SELECT @users=* FROM users;
	PRINT @users;
  SQL
