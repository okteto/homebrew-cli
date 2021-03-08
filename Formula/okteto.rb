class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.11.3"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "c986ec8d56f06b0717df57ab7a0071761b8c12cacefe30866c80fba20b739a54"
    url "https://github.com/okteto/okteto/releases/download/1.11.3/okteto-Darwin-arm64"
  else
    sha256 "e18fc0e8793c1d0adfea43bc50211a63b022ffa6396a83d17ac26b37c5ccac5d"
    url "https://github.com/okteto/okteto/releases/download/1.11.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.11.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
