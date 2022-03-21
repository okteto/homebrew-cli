class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.0.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d622f0494427b884549440058033de50cbee6517b8bd8a79d9f99a90e3500604"
    url "https://github.com/okteto/okteto/releases/download/2.0.0/okteto-Darwin-arm64"
  else
    sha256 "aa51e8018742edbc519c579464f805c53d408018b6b8a9d307bf798eafe8985c"
    url "https://github.com/okteto/okteto/releases/download/2.0.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.0.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
