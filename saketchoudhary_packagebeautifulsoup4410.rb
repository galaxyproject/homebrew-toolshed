require 'formula'
require 'json'

class SaketchoudharyPackagebeautifulsoup4410 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/saket-choudhary/package_beautifulsoup4_4_1_0
  # Tool Shed Readme:
  #    
  #                This Galaxy Tool shed package installs python-bs4(http://www.crummy.com/software/BeautifulSoup/bs4/doc)
  #                package.
  #    
  #                The corresponding PYTHONPATH is accessible via PYTHONPATH_BEAUTIFULSOUP4
  #    
  #                Developmental version is hosted on Github:  https://github.com/saketkc/galaxy_tools/packages/package_beautifulsoup4_4_1_0/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.crummy.com/software/BeautifulSoup/bs4/download/4.0/beautifulsoup4-4.1.0.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python
EOF
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_BEAUTIFULSOUP4', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end