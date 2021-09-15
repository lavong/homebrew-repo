class CertChecker < Formula
    desc "Tool to display certificate chain infos"
    homepage "https://github.com/lavong/cert-checker"
    url "https://github.com/lavong/cert-checker/releases/download/0.0.10/cert-checker.zip"
    version "0.0.10"
    sha256 "d2560b0711aeb26165355850eeca309f51503ff8c78d639eda39e60a3c9ab577"
  
    bottle :unneeded
  
    depends_on "openjdk"
  
    def install
      rm_f Dir["bin/*.bat"]
      libexec.install %w[bin lib]
      (bin/"cert-checker").write_env_script libexec/"bin/cert-checker",
        :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
    end
  
    test do
      output = shell_output("#{bin}/cert-checker --help")
      assert_includes output, "Usage: cert-checker"
    end
end
