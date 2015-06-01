component "toolchain" do |pkg, settings, platform|
  if platform.is_linux?
    pkg.version "2015.05.11"
    pkg.md5sum "90bfc55e78dbf184ccb8ae9d50c0ca9f"
    pkg.url "file://files/linux-toolchain.cmake.txt"
  elsif platform.is_aix?
    pkg.version "2015.05.11"
    pkg.md5sum "0c256056b814a75a25d3fc16266db057"
    pkg.url "file://files/aix-61-ppc-toolchain.cmake.txt"
  end
  filename = pkg.get_url.split('/').last
  # We still need to add support for OS X and Solaris {10,11}/{i386,sparc}.
  pkg.install do
    [
      "mkdir -p #{settings[:prefix]}",
      "cp -pr #{filename} #{settings[:prefix]}/pl-build-toolchain.cmake"
    ]
  end
end