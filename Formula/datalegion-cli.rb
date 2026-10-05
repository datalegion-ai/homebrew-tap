class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/da/9a/1d849d1d87ddbecd197ff049b32b86b4b46918a6b158431a569aff410149/datalegion_cli-1.2.2.tar.gz"
  sha256 "3f8b6300eae86f4031a890877fd0800c2cb2592a34257b65250aadf00ffad064"
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
