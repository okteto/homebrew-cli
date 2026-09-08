class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.23.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "008e084d64836ba570d9c2b11cdba80867fff0b24879e270bd563e4bd17ee324"
    url "https://github.com/okteto/okteto/releases/download/3.23.1/okteto-Darwin-arm64"
  else
    sha256 "370cf01686a04cb5335f9e0656f7beb48ffd35e1f93dcca51bd0611a34308df9"
    url "https://github.com/okteto/okteto/releases/download/3.23.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.23.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
