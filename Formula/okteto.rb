class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.25.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "20a3988600d57679b950e6631ef516abf22507489adb2d7861c01cabd02b5baa"
    url "https://github.com/okteto/okteto/releases/download/2.25.4/okteto-Darwin-arm64"
  else
    sha256 "d33cdd0a56d1a1be5c99ff7a99976be5f60056db5dc7e468fd2e624e6c08d552"
    url "https://github.com/okteto/okteto/releases/download/2.25.4/okteto-Darwin-x86_64"
  end

  head do
    if Hardware::CPU.arm?
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-arm64"
    else
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "okteto-Darwin-arm64"
      mv bin/"okteto-Darwin-arm64", bin/"okteto"
    else
      bin.install "okteto-Darwin-x86_64"
      mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end
  end

  # Homebrew requires tests.
  test do
      assert_match "okteto version 2.25.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
