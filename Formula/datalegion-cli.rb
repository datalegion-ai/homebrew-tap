class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/d1/2f/d2af3f05a0146ec983e57b3d1b2ab25c0a3acf71f41412db4103f3d8e251/datalegion_cli-1.10.2.tar.gz"
  sha256 "20a4d7f3fd65de90072ff8c3bb008613109222d008e035991a69c05276e5ab27"
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
