class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.15.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7a024561f9503e5f058f22b05bca77b73f5ea4c736ad7ff40de4c8ec22000921"
    url "https://github.com/okteto/okteto/releases/download/2.15.0/okteto-Darwin-arm64"
  else
    sha256 "f35467344750a58d243e7452e8248c537dd7b4580b86df12aa63012138ab75cd"
    url "https://github.com/okteto/okteto/releases/download/2.15.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.15.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
