class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.24.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "e6c245dbb958e9a502574f62b192bb910890f2c3f6246dfea8cac022e73af423"
    url "https://github.com/okteto/okteto/releases/download/3.24.0/okteto-Darwin-arm64"
  else
    sha256 "a65c2eeab31885811db438657f777ffc4d9983756bee6c5b9f5357ba0a2a25f4"
    url "https://github.com/okteto/okteto/releases/download/3.24.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.24.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
