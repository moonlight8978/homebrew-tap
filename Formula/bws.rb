class Bws < Formula
  url "https://github.com/bitwarden/sdk-sm/releases/download/bws-v1.0.0/bws-aarch64-apple-darwin-1.0.0.zip"
  sha256 "5dd716878e5627220aa254cbe4e41e978f226f72d9117fc195046709db363e20"

  homepage "https://bitwarden.com/"
  desc "Bitwarden Secrets Manager CLI"
  head "https://github.com/bitwarden/sdk-sm.git", branch: "main"

  livecheck do
    url :stable
    regex(/^bws CLI v(\d+\.\d+\.\d+)$/i)
  end

  depends_on arch: :arm64

  def install
    bin.install "bws"
    generate_completions_from_executable(bin/"bws", "completions", shells: [:zsh])
  end

  test do
    assert_equal true, shell_output("#{bin}/bws --version").include?("bws")
  end
end
