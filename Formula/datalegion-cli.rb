class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/c0/02/c788005640027ee36eeba0da41252cb9777d1e3510f65d83cc82a2e52f01/datalegion_cli-1.5.2.tar.gz"
  sha256 "79c169a5236bde90ae7f5e957c2c4a9d3cb02af9d7ba67309e76041581dbfbfb"
  license "MIT"

  depends_on "python@3.15"

  def install
    venv = libexec/"venv"
    system Formula["python@3.15"].opt_bin/"python3.15", "-m", "venv", venv
    system venv/"bin/pip", "install", buildpath
    bin.install_symlink Dir[venv/"bin/datalegion-cli"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
