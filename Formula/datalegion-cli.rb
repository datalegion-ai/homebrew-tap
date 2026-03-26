class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/0d/d6/eca2324113a4636a6b7cff05629df71c2cc5ced2d173888b6796f54d19f1/datalegion_cli-1.1.1.tar.gz"
  sha256 "9a566099c8201dfad2f093b6b620076213b11c930a0ec3fb76096aebae647d9b"
  license "MIT"

  depends_on "python@3.13"

  def install
    venv = libexec/"venv"
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "datalegion-cli==#{version}"
    bin.install_symlink Dir[venv/"bin/datalegion-cli"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
