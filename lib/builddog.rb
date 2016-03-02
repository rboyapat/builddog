require_relative "builddog/version"
require_relative "builddog/trollop"
require_relative "builddog/providers"

module BuildDog

  def self.print
    puts "#{VERSION}"
  end
end



options = Trollop.options do

  banner <<-EOS
Usage: builddog.rb -o vm_create --provisioner 10.0.0.1 -u admin -p password  
       builddog.rb --operation vm_create --provisioner 10.0.0.1 --user admin --password password  
  EOS

  builddog_opt
end

###

Label1 = <<EOF 

Logic to check what and how many arguments are passed to program

if options.length > 0
  open instance of class 

elsif File.open("buildog_credentials", "r")

else
  
 
fi

EOF
#####

BuildDog.providers options
