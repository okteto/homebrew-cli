class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.10.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "2f61115acf84b6ce5b15cf8888e4c8bf4661d6d8754c956ac120d145b368c937"
    url "https://github.com/okteto/okteto/releases/download/2.10.3/okteto-Darwin-arm64"
  else
    sha256 "f0f7226210c28c6e947299ad43c80bbfdbb0159a5821becb6159a80685397d6c"
    url "https://github.com/okteto/okteto/releases/download/2.10.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.10.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
