class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/21/98/01b08f48f1a4ad2aaf8e3f8c7a1d40e610dc0a9c1ea792c9f222cda919fa/datalegion_cli-1.10.1.tar.gz"
  sha256 "3143994e5c2754fcea7252046ac608e26ccd3fcefb68a9f18d141f925b04e8ce"
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
