class Lead < Formula
  desc "Graphite-shaped stacking with worktree-first parallelism"
  homepage "https://github.com/fattman2008/lead"
  url "https://github.com/fattman2008/lead/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "52faf7a830263a158abc2028d49f11d039b1b063550017a4bceb524f043f95f2"
  license "MIT"

  depends_on "go" => :build
  depends_on "worktrunk"
  depends_on "withgraphite/tap/graphite"

  def install
    ldflags = "-X github.com/fattman2008/lead/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"pt"), "./cmd/pt"
  end

  def caveats
    <<~EOS
      After install, run once:
        pt setup

      This configures Worktrunk worktree paths and shell integration
      (required for auto-cd into branch worktrees).

      If Homebrew prompts about tap trust (Homebrew 6+), you may need:
        brew trust fattman2008/tap
        brew trust withgraphite/tap
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pt --version")
  end
end
