class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.29.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5eb334bf9e0279d1cecb81ff448b73126d4ca7dc9c490216e5e8c68365720a51"
    url "https://github.com/okteto/okteto/releases/download/2.29.0/okteto-Darwin-arm64"
  else
    sha256 "1491053bc362b161f3ca1ba857d6d3d6bfa55bb02c722d45924e94bd0646572d"
    url "https://github.com/okteto/okteto/releases/download/2.29.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.29.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
