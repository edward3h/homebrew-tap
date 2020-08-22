class McPackInstaller < Formula
  desc "Minecraft Addon Pack Installer"
  homepage "https://github.com/edward3h/mc-pack-installer"
  url "https://github.com/edward3h/mc-pack-installer/archive/v1.0.0-rc1.tar.gz"
  sha256 "3b56cfa90ff85c6d4cc05dfe6e76959c936737fbf29def3a8e4e1dd598b41c38"
  license "GPL-3.0-only"

  depends_on java: "1.8"

  def install
    system "./gradlew", "installDist"
    bin.install "build/install/mc-pack-installer/bin/mc-pack-installer"
    lib.install Dir["build/install/mc-pack-installer/lib/*"]
  end

  test do
    # just check that the command runs for now
    system "#{bin}/mc-pack-installer"
  end
end
