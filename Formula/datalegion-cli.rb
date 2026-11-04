class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/8e/bd/a0506fb4e133e14c6e0a9a9d35d077e88462462f40ba9ca080a18bf3aee2/datalegion_cli-1.7.0.tar.gz"
  sha256 "655a78404cbeb27e0ce386961067fb29dc4a1d8c3d379663b84d62b67122ec78"
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
