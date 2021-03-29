class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "173cca6ddb0d1a4a0bcc3332a5a2bbdc86e03d1187bbc4e755cabcc870d054ed"
    url "https://github.com/okteto/okteto/releases/download/1.12.2/okteto-Darwin-arm64"
  else
    sha256 "4309f20dd98dde2ae40d7acc8b87e83a9706f7c3a241cd13e4902bb942a608e9"
    url "https://github.com/okteto/okteto/releases/download/1.12.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
