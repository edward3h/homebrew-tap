# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class McPackInstaller < Formula
  desc "work in progress, don't try to use it uet"
  homepage "https://github.com/edward3h/mc-pack-installer"
  url "https://github.com/edward3h/mc-pack-installer/archive/v1.0.0-rc1.tar.gz"
  sha256 "3b56cfa90ff85c6d4cc05dfe6e76959c936737fbf29def3a8e4e1dd598b41c38"
  license "GPL-3.0-only"

  depends_on :java => "1.8"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./gradlew", "installDist"
    bin.install "build/install/mc-pack-installer/bin/mc-pack-installer"
    lib.install Dir["build/install/mc-pack-installer/lib/*"]
  end

  test do
    # just check that the command runs for now
    system "#{bin}/mc-pack-installer"
  end
end
