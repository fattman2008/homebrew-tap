class Lead < Formula
  desc "Graphite-shaped stacking with worktree-first parallelism"
  homepage "https://github.com/fattman2008/lead"
  url "https://github.com/fattman2008/lead/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "7fdf0edcd670d96d26c740862f3bca2ac8c59674f5046714954c4b1d8ce9b69c"
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
