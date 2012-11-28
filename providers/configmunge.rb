action :munge do
  rebuilt_config = Array.new
  ::File.open(new_resource.config_file, "r") do | f |
    while line = f.gets
      if line =~ new_resource.filter
        next
      else
        rebuilt_config << line
      end
    end
  end
  rebuilt_config.push(*new_resource.appended_configs)
  ::File.open(new_resource.config_file, "w") do | f |
    rebuilt_config.each do | line |
      f.write(line)
    end
  end
end
