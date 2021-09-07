class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.10"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7c0ecdc939546bbf0feb44c5a6fc0fdf67ca66fd4681695ba39daabbd78ba707"
    url "https://github.com/okteto/okteto/releases/download/1.13.10/okteto-Darwin-arm64"
  else
    sha256 "f11d7464a0059ae7610383bbc981682890d44859a6318e7bf4af0d56c299a982"
    url "https://github.com/okteto/okteto/releases/download/1.13.10/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.10", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
