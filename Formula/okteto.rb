class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.7.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "0574c386a7370b4d605de6bb86594625827c1df5794ea4306d7330fba62eed11"
    url "https://github.com/okteto/okteto/releases/download/2.7.2/okteto-Darwin-arm64"
  else
    sha256 "adc23ef1e6dee56dd1eda60bd3ab2bd68e8a8ac6ec4540b265bf1661c81d1fbe"
    url "https://github.com/okteto/okteto/releases/download/2.7.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.7.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
