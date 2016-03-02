module BuildDog

  require 'yaml'
  require 'ipaddress'
  require_relative "providers/vsphere"
  require_relative "providers/aws"

  def self.providers ( options )
    case options[:provider]
      when "vsphere"
        vsphere options
      when "aws"
        aws options
      else
        puts "unknown provider"
    end
  end

end
