require 'msfdb_helpers/db_interface'

module MsfdbHelpers
  class PgCtl < DbInterface

    def initialize(db_path:, options:, localconf:, db_conf:)
      @db = db_path
      @options = options
      @localconf = localconf
      @db_conf = db_conf
      super(options)
    end

    def init(msf_pass, msftest_pass)
      if Dir.exist?(@db)
        puts "Found a database at #{@db}, checking to see if it is started"
        start
        return
      end

      if File.exist?(@db_conf) && !@options[:delete_existing_data]
        if !load_db_config
          puts 'Failed to load existing database config. Please reinit and overwrite the file.'
          return
        end
      else
        write_db_config
      end

      puts "Creating database at #{@db}"
      Dir.mkdir(@db)
      run_cmd("initdb --auth-host=trust --auth-local=trust -E UTF8 #{@db.shellescape}")

      File.open("#{@db}/postgresql.conf", 'a') do |f|
        f.puts "port = #{@options[:db_port]}"
      end

      start

      create_db_users(msf_pass, msftest_pass)

      write_db_client_auth_config
      restart
    end

    def delete
      if Dir.exist?(@db)
        stop

        if @options[:delete_existing_data]
          puts "Deleting all data at #{@db}"
          FileUtils.rm_rf(@db)
        end

        if @options[:delete_existing_data]
          File.delete(@db_conf)
        end
      else
        puts "No data at #{@db}, doing nothing"
      end
    end

    def reinit(msf_pass, msftest_pass)
      delete
      init(msf_pass, msftest_pass)
    end

    def start
      if run_cmd("pg_ctl -o \"-p #{@options[:db_port]}\" -D #{@db.shellescape} status") == 0
        puts "Database already started at #{@db}"
        return true
      end

      print "Starting database at #{@db}..."
      run_cmd("pg_ctl -o \"-p #{@options[:db_port]}\" -D #{@db.shellescape} -l #{@db.shellescape}/log start")
      sleep(2)
      if run_cmd("pg_ctl -o \"-p #{@options[:db_port]}\" -D #{@db.shellescape} status") != 0
        puts 'failed'.red.bold.to_s
        false
      else
        puts 'success'.green.bold.to_s
        true
      end
    end

    def stop
      if run_cmd("pg_ctl -o \"-p #{@options[:db_port]}\" -D #{@db.shellescape} status") == 0
        puts "Stopping database at #{@db}"
        run_cmd("pg_ctl -o \"-p #{@options[:db_port]}\" -D #{@db.shellescape} stop")
      else
        puts "Database is no longer running at #{@db}"
      end
    end

    def restart
      stop
      start
    end

    def status
      if Dir.exist?(@db)
        if run_cmd("pg_ctl -o \"-p #{@options[:db_port]}\" -D #{@db.shellescape} status") == 0
          puts "Database started at #{@db}"
        else
          puts "Database is not running at #{@db}"
        end
      else
        puts "No database found at #{@db}"
      end
    end

    def create_db_users(msf_pass, msftest_pass)
      puts 'Creating database users'
      run_psql("create user #{@options[:msf_db_user].shellescape} with password '#{msf_pass}'")
      run_psql("create user #{@options[:msftest_db_user].shellescape} with password '#{msftest_pass}'")
      run_psql("alter role #{@options[:msf_db_user].shellescape} createdb")
      run_psql("alter role #{@options[:msftest_db_user].shellescape} createdb")
      run_psql("alter role #{@options[:msf_db_user].shellescape} with password '#{msf_pass}'")
      run_psql("alter role #{@options[:msftest_db_user].shellescape} with password '#{msftest_pass}'")

      conn = PG.connect(host: @options[:db_host], dbname: 'postgres', port: @options[:db_port], user: @options[:msf_db_user], password: msf_pass)
      conn.exec("CREATE DATABASE #{@options[:msf_db_name]}")
      conn.exec("CREATE DATABASE #{@options[:msftest_db_name]}")
      conn.finish
    end

    def write_db_client_auth_config
      client_auth_config = "#{@db}/pg_hba.conf"
      super(client_auth_config)
    end

    def self.requirements
      %w[psql pg_ctl initdb createdb]
    end
  end
end
