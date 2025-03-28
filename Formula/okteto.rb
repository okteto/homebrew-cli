class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.5.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "cd43fabc46b98748d059c7fb639cf45292ce4b76fe0d54719996ca4e285ca571"
    url "https://github.com/okteto/okteto/releases/download/3.5.1/okteto-Darwin-arm64"
  else
    sha256 "9bc8c56315f03e179872d36da048a00a614f3f279518f76c51d8668bea24dbc2"
    url "https://github.com/okteto/okteto/releases/download/3.5.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.5.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
