cask "rasql" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "588abac4c3467ccc33a3135e232a99d6eacd04781d9d1a1638cc9aae7062b28b",
         intel: "5bd9e2cb8567f41b91a8119ade402bd0685cca098e7db68f12f5e048a1373df1"

  url "https://github.com/rmpel/rasql-database-manager/releases/download/v#{version}/RaSQL-#{version}-mac-#{arch}.zip"
  name "RaSQL"
  desc "Database manager for web developers: MySQL, MariaDB and SQLite"
  homepage "https://github.com/rmpel/rasql-database-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "RaSQL.app"

  zap trash: [
    "~/Library/Application Support/RaSQL",
    "~/Library/Preferences/nl.remonpel.rasql.plist",
    "~/Library/Saved Application State/nl.remonpel.rasql.savedState",
  ]

  caveats <<~EOS
    RaSQL is free and open source, and not notarized by Apple.
    The first time you open it, macOS blocks it. To allow it:
      System Settings > Privacy & Security > "RaSQL was blocked" > Open Anyway
    This is needed once per installed version.
  EOS
end
