require 'formula'
require 'json'

class FubarPackagegraphicsmagick1320 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/fubar/package_graphicsmagick_1_3_20
  # Tool Shed Readme:
  #    Compiling GraphicsMagick requires a C compiler (typically gcc). You can access the GraphicsMagick root directory (including lib/, include/ and bin/) through the $GRAPHICSMAGICK_ROOT_DIR system variable.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/graphicsmagick/files/graphicsmagick/1.3.20/GraphicsMagick-1.3.20.tar.gz/download"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix} --enable-shared=yes" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'GRAPHICSMAGICK_ROOT_DIR', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end