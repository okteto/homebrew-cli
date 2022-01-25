class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "67b4eb7e8914fcc6b50513714fef15f0906e5392aa75758a5921e304a19a1cf0"
    url "https://github.com/okteto/okteto/releases/download/1.15.1/okteto-Darwin-arm64"
  else
    sha256 "7430e94ba4e332e2da32c22b736fd3c16638a7eb5a17da77e35d7ab52118bcca"
    url "https://github.com/okteto/okteto/releases/download/1.15.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
