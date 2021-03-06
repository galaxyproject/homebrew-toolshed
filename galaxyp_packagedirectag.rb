require 'formula'
require 'json'

class GalaxypPackagedirectag < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/package_directag
  # Tool Shed Readme:
  #    
  #                This package downloads and installs directag.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://bitbucket.org/galaxyp-applications/directag/get/d0e8917.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/"
    mv "directag", "#{prefix}/"
    system "mkdir", "-p", "#{prefix}/"
    mv "adjustScanRankerScoreByGroup", "#{prefix}/"
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end