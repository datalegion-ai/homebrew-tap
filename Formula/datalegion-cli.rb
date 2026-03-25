class DatalegionCli < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/source/d/datalegion-cli/datalegion_cli-1.0.0.tar.gz"
  sha256 "274d32c34ce14020ab0442c1c401acdcd9e6cd64b47c77b071ed2559471fb1bf"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
