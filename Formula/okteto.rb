class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.11"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "9422dcff73da453551a315541b26e548cb3b8c454c7dba79669fef99416acc96"
    url "https://github.com/okteto/okteto/releases/download/1.13.11/okteto-Darwin-arm64"
  else
    sha256 "85adb39350cf0b7edc32df8ae685e060c96139af585bad8887d6ec48b87f539f"
    url "https://github.com/okteto/okteto/releases/download/1.13.11/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.11", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
