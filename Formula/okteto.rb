class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.3.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "2b7a975eaef44ee29b93f5ac525acf1a35cb690d98cfbaab602e13be84d04e13"
    url "https://github.com/okteto/okteto/releases/download/2.3.1/okteto-Darwin-arm64"
  else
    sha256 "9365f1d4c28ef70f053ec7420e1b45123c182fc70d321f97a084a7b01a5a701d"
    url "https://github.com/okteto/okteto/releases/download/2.3.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.3.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
